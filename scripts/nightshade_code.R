###############################################
# Nighttime shading on an sf world map (animated)
# Period: 2025-09-21 10:00:00 UTC to 2025-09-23 12:00:00 UTC
# Author: (you)
###############################################

# ---------- helper: install if missing ----------
install_if_missing <- function(pkgs) {
  to_install <- pkgs[!(pkgs %in% installed.packages()[, "Package"])]
  if (length(to_install)) install.packages(to_install, repos = "https://cloud.r-project.org")
}
install_if_missing(c(
  "sf", "rnaturalearth", "rnaturalearthdata",
  "ggplot2", "gganimate", "suncalc", "dplyr", "tidyr",
  "lubridate", "scales", "progress"
))

# ---------- libraries ----------
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggplot2)
library(gganimate)
library(suncalc)
library(dplyr)
library(tidyr)
library(lubridate)
library(scales)
library(progress)

# ---------- parameters ----------
# Time window (UTC)
t_start <- ymd_hms("2025-09-21 12:00:00", tz = "UTC")
t_end   <- ymd_hms("2025-09-23 12:00:00", tz = "UTC")
# Step between frames (adjust to taste: "30 mins", "1 hour", etc.)
time_step <- "15 mins"

# Spatial grid resolution (degrees). 2° keeps things light; 1° looks smoother but is heavier.
lon_step <- 0.5
lat_step <- 0.5

# Darkness mapping: fully dark at civil twilight (-6°), linearly increasing from 0 to 1 as altitude goes 0 -> -6°.
dark_full_altitude <- -6 # degrees

# Output animation file
out_file <- "nightshade_world_2025-09-21_to_2025-09-23.gif"
# Frame rate and dimensions
fps_out <- 12
width_px <- 1400
height_px <- 800

# ---------- data: world map ----------
world <- ne_countries(scale = "medium", returnclass = "sf") |>
  st_transform(4326)  # keep in lon/lat for simplicity

# ---------- build lon/lat grid ----------
lons <- seq(-180, 180, by = lon_step)
lats <- seq(-90,  90,  by = lat_step)
grid <- expand.grid(lon = lons, lat = lats) |>
  as_tibble()

# ---------- time sequence ----------
times_utc <- seq(t_start, t_end, by = time_step)

# ---------- compute sun altitude for each (lon, lat, time) ----------
# We'll loop over time slices (efficient enough for this grid size),
# compute altitude (in radians from suncalc), convert to degrees,
# then map to a "darkness" alpha value.
pb <- progress_bar$new(
  format = "Computing sunlight positions [:bar] :percent ETA: :eta",
  total = length(times_utc), clear = FALSE, width = 70
)

compute_slice <- function(tt) {
  
  # build a data frame with the timestamp repeated for each grid point
  df <- data.frame(
    date = rep(tt, nrow(grid)),
    lat  = grid$lat,
    lon  = grid$lon
  )
  
  # call suncalc with a data frame instead of separate lat/lon vectors
  sp <- suncalc::getSunlightPosition(data = df, keep = c("altitude"))
  
  # altitude is returned in radians; convert to degrees
  alt_deg <- sp$altitude * 180 / pi
  
  # darkness mapping (same as before)
  darkness <- pmin(1, pmax(0, -alt_deg / 6))
  
  tibble(
    lon = grid$lon,
    lat = grid$lat,
    time = tt,
    alt_deg = alt_deg,
    darkness = darkness
  )
}

# Create the progress bar once
pb <- progress_bar$new(
  format = "Computing slices [:bar] :percent eta: :eta",
  total = length(times_utc), clear = FALSE, width = 70
)

shade_list <- vector("list", length(times_utc))

for (i in seq_along(times_utc)) {
  # Compute one time slice (without pb$tick() inside)
  shade_list[[i]] <- compute_slice(times_utc[[i]])
  # Now update the bar
  pb$tick()
}

shade_df <- dplyr::bind_rows(shade_list)

shade_df <- bind_rows(lapply(times_utc, compute_slice))

# ---------- plot & animate ----------
# Notes:
# - We draw the world polygons (light grey) and overlay a tile layer whose alpha is 'darkness'.
# - We keep everything in EPSG:4326 (Plate Carrée) so geom_tile aligns with lon/lat.
# - If you'd like a projection like Robinson, you can rasterize/warp the grid beforehand, or
#   stick to 4326 for a simple and robust pipeline.

p <- ggplot() +
  geom_sf(data = world, fill = "grey95", color = "grey70", size = 0.1) +
  # tile overlay for night shading (black with varying alpha)
  geom_tile(
    data = shade_df,
    mapping = aes(x = lon, y = lat, alpha = darkness),
    fill = "black",
    width = lon_step, height = lat_step
  ) +
  scale_alpha(range = c(0, 0.6), limits = c(0, 1), guide = "none") +
  coord_sf(expand = FALSE, crs = 4326, xlim = c(-180, 180), ylim = c(-90, 90)) +
  labs(
    title = "Nighttime Shading (UTC): {format(frame_time, '%Y-%m-%d %H:%M:%S')}",
    subtitle = "Darkness ~ sun altitude (fully dark ≤ -6°)",
    caption = "Grid: 0.5° × 0.5° | Data: suncalc, Natural Earth"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    panel.grid.major = element_line(size = 0.1, colour = "grey85"),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  ) +
  transition_time(time)

# Render
# On some systems, gifski is the default; otherwise you may need to install 'gifski' or 'magick'.
anim <- animate(
  p,
  fps = fps_out,
  width = width_px,
  height = height_px,
  renderer = gifski_renderer(loop = TRUE)
)

anim_save(out_file, animation = anim)
message(sprintf("Saved animation to: %s", normalizePath(out_file)))
