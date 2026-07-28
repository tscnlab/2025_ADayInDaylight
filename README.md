# A Day in Daylight 2025 dataset

This dataset combines one-minute wearable light measurements with structured
contextual event logs from *A Day in Daylight 2025*, a TUM and TUMCREATE-led
participatory event for Daylight Awareness Week 2025. Contributors recorded
light exposure and changes in activity and lighting context on and around the
September equinox.

The release represents 47 contributors in 15 countries and 10 UTC offsets. It
contains 141,000 participant-minutes, 1,763 contextual event intervals, 47
participant-summary rows and three travel intervals. The same opaque
`participant_id` links the four tables.

The files are licensed under Creative Commons Attribution 4.0 International
(CC BY 4.0). Cite this version using the deposited Zenodo Dataset DOI
[10.5281/zenodo.21654277](https://doi.org/10.5281/zenodo.21654277).

## Data files

- `participant_data/light_1min.csv` — a complete one-minute grid with recorded
  and corrected timestamps, logger family, source epoch, contribution count,
  photopic illuminance, melanopic equivalent daylight illuminance where
  supported, explicit-gap status and validation flags.
- `participant_data/events.csv` — chronologically ordered structured states for
  wear, activity, setting, daylight, electric light, screen use and lighting
  autonomy.
- `participant_data/participant_metadata.csv` — logger family, exact age, sex
  assigned at birth, cleaned country, coordinates rounded to one decimal place
  and aggregate completeness counts.
- `participant_data/travel_segments.csv` — three minute-resolution travel
  intervals with IANA time zones and opaque dated-flight identifiers.

`data_dictionary.csv` defines every released variable, unit, allowed value,
source and transformation. `correction_log.csv` records consequential
adjudications, and `provenance.yml` records the release lineage and software
environment.

## Linking the tables

Use `participant_id` for person-level linkage. A contextual interval applies
when a light timestamp is greater than or equal to `event_start_utc` and less
than `event_end_utc`. The terminal event for a contributor can have no
`event_end_utc`; it must not be extended beyond the documented interval.

`flight_id` links contributors who reported the same dated flight without
revealing the carrier or flight number. It is not a participant identifier.

The self-contained `data_showcase.html` and its R/Quarto source
`data_showcase.qmd` demonstrate the file structure, equality and interval
linkage, participant-balanced local-clock profiles and contextual-duration
summaries.

## Measurement and time semantics

ActLumus provides photopic illuminance and melanopic equivalent daylight
illuminance. ActTrust provides photopic illuminance only; its
`melanopic_edi_lux` values are therefore missing. Photopic and melanopic
quantities must not be substituted for one another.

Forty-three included streams have a 10-second dominant source epoch and four
have a 60-second epoch. The public grid uses floor-aligned one-minute means.
Rows with no contributing observation are retained as explicit gaps with
missing light values and are never replaced with zero.

## Privacy and responsible reuse

The files are pseudonymised. Direct identifiers, source record
identifiers, device serials, city, exact coordinates, raw flight numbers, free
text and mobile-device payloads are excluded. Exact age, sex assigned at birth,
one-decimal coordinates, exact timestamps and contextual sequences are retained. Do not attempt to identify
contributors or combine these data with external information for that purpose.

## Related resources

- Dataset DOI: <https://doi.org/10.5281/zenodo.21654277>
- GitHub `data_note` branch:
  <https://github.com/tscnlab/2025_ADayInDaylight_Data/tree/data_note>
- Project website: <https://tscnlab.github.io/2025_ADayInDaylight/>
- Interactive dashboard:
  <https://tscnlab.github.io/2025_ADayInDaylight/Dashboard.html>
- Underlying R/Quarto analysis:
  <https://tscnlab.github.io/2025_ADayInDaylight/Analysis.html>
- Original source and analysis repository:
  <https://github.com/tscnlab/2025_ADayInDaylight>
- Software archive: <https://doi.org/10.5281/zenodo.17464829>
