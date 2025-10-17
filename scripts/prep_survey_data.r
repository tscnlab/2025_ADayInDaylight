#Clear existing data and graphics
rm(list=ls())
# graphics.off()
#Load Hmisc library
# library(Hmisc)
#Read Data
data=read.csv('data/survey/survey_data.csv')
#Setting Labels

label(data$record_id) = "Record ID"
label(data$redcap_repeat_instrument) = "Repeat Instrument"
label(data$redcap_repeat_instance) = "Repeat Instance"
label(data$intake_questionnaire_timestamp) = "Survey Timestamp"
label(data$age) = "What is your age in years? This information is just used to later on describe the characteristics of the participants."
label(data$sex) = "What sex were you assigned at birth, on your original birth certificate? This information is just used to later on describe the characteristics of the participants."
label(data$intake_questionnaire_complete) = "Complete?"
label(data$log_a_new_activity_timestamp) = "Survey Timestamp"
label(data$type) = "Wear typeAre you wearing the light logger at the moment?"
label(data$social_context) = "Are you alone or with others?"
label(data$wear_activity) = "Wear activity "
label(data$nonwear_activity) = "Non-wear activity"
label(data$nighttime) = "Where was the light logger when you were asleep?"
label(data$setting_level01) = "Select the setting"
label(data$setting_level02_indoors) = "Indoors setting"
label(data$setting_level02_indoors_home) = "Indoors setting (home)"
label(data$setting_level02_indoors_workingspace) = "Indoors setting (working space)"
label(data$setting_level02_indoors_learningfacility) = "Indoors setting (learning facility)"
label(data$setting_level02_indoors_retailfacility) = "Indoors setting (retail facility)"
label(data$setting_level02_indoors_healthfacility) = "Indoors setting (health facility)"
label(data$setting_level02_indoors_leisurespace) = "Indoors setting (leisure space)"
label(data$setting_level02_outdoors) = "Outdoors setting"
label(data$setting_level02_mixed) = "Indoors-outdoors setting"
label(data$lighting_scenario_daylight___1) = "Select lighting setting (daylight) (choice=Outdoors (direct sunlight))"
label(data$lighting_scenario_daylight___2) = "Select lighting setting (daylight) (choice=Outdoors (in shade / cloudy))"
label(data$lighting_scenario_daylight___3) = "Select lighting setting (daylight) (choice=Indoors (near window / exposed to daylight))"
label(data$lighting_scenario_daylight___4) = "Select lighting setting (daylight) (choice=Indoors (away from window))"
label(data$lighting_scenario_3___1) = "Select lighting setting (electric light) (choice=Lights are switched on)"
label(data$lighting_scenario_3___2) = "Select lighting setting (electric light) (choice=Low-light or dimmed lights)"
label(data$lighting_scenario_3___3) = "Select lighting setting (electric light) (choice=Completed darkness)"
label(data$lighting_scenario_2___1) = "Select lighting setting (screen use) (choice=Smartphone)"
label(data$lighting_scenario_2___2) = "Select lighting setting (screen use) (choice=Tablet)"
label(data$lighting_scenario_2___3) = "Select lighting setting (screen use) (choice=Computer)"
label(data$lighting_scenario_2___4) = "Select lighting setting (screen use) (choice=Television)"
label(data$autonomy) = "Were the lighting conditions in this setting self-selected (i.e., you had control over lighting intensity, spectrum, or exposure)?"
label(data$notes) = "Open-ended comments"
label(data$par_joindate) = "Install Date"
label(data$par_joindate_utc) = "Install Date (UTC)"
label(data$par_timezone) = "Participant Timezone"
label(data$par_code) = "Participant Code"
label(data$uuid) = "UUID"
label(data$startdate) = "Start Date"
label(data$enddate) = "End Date"
label(data$scheduledate) = "Schedule Date"
label(data$status) = "Status"
label(data$supplementaldata) = "Supplemental Data (JSON)"
label(data$serializedresult) = "Serialized Result"
label(data$log_a_new_activity_complete) = "Complete?"
label(data$post_participation_survey_timestamp) = "Survey Timestamp"
label(data$complete_log) = "Confidence in complete logging  On a scale from 1 (not at all confident) to 5 (completely confident), how confident are you that you logged your activities and light exposure every time you were supposed to?"
label(data$behaviour_change) = "Behaviour change  Did you change your usual routine or behaviour because you were participating in this event?"
label(data$yes_behaviour_change) = "If yes, please describe briefly"
label(data$situation_logging_difficulty) = "Situations where logging was difficult  Were there specific times, activities, or situations when you could not log or found it hard to log?"
label(data$other_feedback) = "Other feedback  Any other comments, suggestions, or issues youd like to share about the logging experience (e.g., clarity of instructions, technical problems, improvements)?"
label(data$travel_time_zone) = "Travel across time zones  During the logging period: Did you travel across time zones?"
label(data$travel_departure_time) = "Travel across time zones  If yes, please list departure time zone(s):"
label(data$travel_arrival_time) = "Travel across time zones  Arrival time zone(s):"
label(data$travel_date_time_travel) = "Travel across time zones  Approximate dates/time of travel:"
label(data$city_country) = "City and country"
label(data$latitude) = "Latitude"
label(data$longitude) = "Longitude "
label(data$post_participation_survey_complete) = "Complete?"
label(data$device_information_timestamp) = "Survey Timestamp"
label(data$device_id) = "Device ID"
label(data$device_information_complete) = "Complete?"
label(data$detailed_time_zone_changes_timestamp) = "Survey Timestamp"
label(data$tz_identifier_start) = "TZ identifier (start)"
label(data$datetime_start) = "Time start"
label(data$tz_identifier_end) = "TZ identifier (end)"
label(data$datetime_end) = "Time start"
label(data$flight_no) = "Flight number"
label(data$detailed_time_zone_changes_complete) = "Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
mapping_redcap_repeat_instrument = c(
	"log_a_new_activity" = "Log a new activity"
)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument, levels = names(mapping_redcap_repeat_instrument), labels = mapping_redcap_repeat_instrument)

mapping_sex = c(
	"1" = "Female",
	"2" = "Male",
	"3" = "Intersex",
	"4" = "Prefer not to answer"
)
data$sex.factor = factor(data$sex, levels = names(mapping_sex), labels = mapping_sex)

mapping_intake_questionnaire_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$intake_questionnaire_complete.factor = factor(data$intake_questionnaire_complete, levels = names(mapping_intake_questionnaire_complete), labels = mapping_intake_questionnaire_complete)

mapping_type = c(
	"1" = "Wear-time",
	"2" = "Non-wear time",
	"3" = "Bedtime (not wearing light logger)"
)
data$type.factor = factor(data$type, levels = names(mapping_type), labels = mapping_type)

mapping_social_context = c(
	"1" = "Alone",
	"2" = "With others"
)
data$social_context.factor = factor(data$social_context, levels = names(mapping_social_context), labels = mapping_social_context)

mapping_wear_activity = c(
	"1" = "Sedentary (mostly sitting: desk work, TV)",
	"2" = "Light activity (easy movement: slow walk, light chores)",
	"3" = "Moderate activity (brisk walk, easy cycling)",
	"4" = "High-intensity activity (running, fast cycling, vigorous sports)"
)
data$wear_activity.factor = factor(data$wear_activity, levels = names(mapping_wear_activity), labels = mapping_wear_activity)

mapping_nonwear_activity = c(
	"1" = "Left in a drawer or cabinet, or other stationary dark place",
	"2" = "Left in a bag, or other mobile dark place",
	"3" = "Left on a table or other surface with varying light exposure",
	"4" = "Other"
)
data$nonwear_activity.factor = factor(data$nonwear_activity, levels = names(mapping_nonwear_activity), labels = mapping_nonwear_activity)

mapping_nighttime = c(
	"1" = "Facing upward on bedside table",
	"2" = "Facing downward on bedside table",
	"3" = "Other"
)
data$nighttime.factor = factor(data$nighttime, levels = names(mapping_nighttime), labels = mapping_nighttime)

mapping_setting_level01 = c(
	"1" = "Indoors (completely inside building or enclosed space)",
	"2" = "Outdoors (completely outside, exposed to the open air)",
	"3" = "Indoor-outdoor setting (transitional spaces, including vehicles and partially covered areas)"
)
data$setting_level01.factor = factor(data$setting_level01, levels = names(mapping_setting_level01), labels = mapping_setting_level01)

mapping_setting_level02_indoors = c(
	"1" = "Home",
	"2" = "Working space",
	"3" = "Learning facility",
	"4" = "Retail, food or services facility",
	"5" = "Health facility",
	"6" = "Leisure space (sports, recreation, entertainment)",
	"7" = "Other"
)
data$setting_level02_indoors.factor = factor(data$setting_level02_indoors, levels = names(mapping_setting_level02_indoors), labels = mapping_setting_level02_indoors)

mapping_setting_level02_indoors_home = c(
	"1" = "Home office",
	"2" = "Bedroom",
	"3" = "Kitchen",
	"4" = "Bathroom",
	"5" = "Living room",
	"6" = "Parking garage",
	"7" = "Other"
)
data$setting_level02_indoors_home.factor = factor(data$setting_level02_indoors_home, levels = names(mapping_setting_level02_indoors_home), labels = mapping_setting_level02_indoors_home)

mapping_setting_level02_indoors_workingspace = c(
	"1" = "Open-plan office area",
	"2" = "Conference/meeting room",
	"3" = "Break/lounge area",
	"4" = "Personal workspace/desk",
	"5" = "Corridor",
	"6" = "Parking garange",
	"7" = "Other"
)
data$setting_level02_indoors_workingspace.factor = factor(data$setting_level02_indoors_workingspace, levels = names(mapping_setting_level02_indoors_workingspace), labels = mapping_setting_level02_indoors_workingspace)

mapping_setting_level02_indoors_learningfacility = c(
	"1" = "Classroom",
	"2" = "Lecture hall",
	"3" = "Studio",
	"4" = "Cafeteria",
	"5" = "Library",
	"6" = "Laboratory",
	"7" = "Other"
)
data$setting_level02_indoors_learningfacility.factor = factor(data$setting_level02_indoors_learningfacility, levels = names(mapping_setting_level02_indoors_learningfacility), labels = mapping_setting_level02_indoors_learningfacility)

mapping_setting_level02_indoors_retailfacility = c(
	"1" = "Shopping mall",
	"2" = "Convenience store/supermarkt",
	"3" = "Restaurant/cafeteria/bakery",
	"4" = "Bank/ATM",
	"5" = "Office supply store",
	"6" = "Other"
)
data$setting_level02_indoors_retailfacility.factor = factor(data$setting_level02_indoors_retailfacility, levels = names(mapping_setting_level02_indoors_retailfacility), labels = mapping_setting_level02_indoors_retailfacility)

mapping_setting_level02_indoors_healthfacility = c(
	"1" = "Hospital",
	"2" = "Clinic",
	"3" = "Dentist",
	"4" = "Drug store",
	"5" = "Other"
)
data$setting_level02_indoors_healthfacility.factor = factor(data$setting_level02_indoors_healthfacility, levels = names(mapping_setting_level02_indoors_healthfacility), labels = mapping_setting_level02_indoors_healthfacility)

mapping_setting_level02_indoors_leisurespace = c(
	"1" = "Gym/fitness centre",
	"2" = "Sprots court",
	"3" = "Swimming pool",
	"4" = "Spa/wellness centre",
	"5" = "Cinema/movie theatre",
	"6" = "Other"
)
data$setting_level02_indoors_leisurespace.factor = factor(data$setting_level02_indoors_leisurespace, levels = names(mapping_setting_level02_indoors_leisurespace), labels = mapping_setting_level02_indoors_leisurespace)

mapping_setting_level02_outdoors = c(
	"1" = "Home",
	"2" = "Working space",
	"3" = "Learning facility",
	"4" = "Retail, food or services facility",
	"5" = "Health facility",
	"6" = "Leisure space (sports, recreation, entertainment)",
	"7" = "Other"
)
data$setting_level02_outdoors.factor = factor(data$setting_level02_outdoors, levels = names(mapping_setting_level02_outdoors), labels = mapping_setting_level02_outdoors)

mapping_setting_level02_mixed = c(
	"1" = "Covered patio or terrace",
	"2" = "Semi-open corridor/gallery",
	"3" = "Balcony",
	"4" = "Veranda",
	"5" = "Atrium",
	"6" = "Transportation (car/taxi)",
	"7" = "Transportation (bus or commuter/regional rail)",
	"8" = "Transportation (long-distance train)",
	"9" = "Transportation (underground, subway)",
	"10" = "Transportation (airplane)",
	"11" = "Transportation (bike)",
	"12" = "Transportation (ferry)",
	"13" = "Other"
)
data$setting_level02_mixed.factor = factor(data$setting_level02_mixed, levels = names(mapping_setting_level02_mixed), labels = mapping_setting_level02_mixed)

mapping_lighting_scenario_daylight___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_daylight___1.factor = factor(data$lighting_scenario_daylight___1, levels = names(mapping_lighting_scenario_daylight___1), labels = mapping_lighting_scenario_daylight___1)

mapping_lighting_scenario_daylight___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_daylight___2.factor = factor(data$lighting_scenario_daylight___2, levels = names(mapping_lighting_scenario_daylight___2), labels = mapping_lighting_scenario_daylight___2)

mapping_lighting_scenario_daylight___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_daylight___3.factor = factor(data$lighting_scenario_daylight___3, levels = names(mapping_lighting_scenario_daylight___3), labels = mapping_lighting_scenario_daylight___3)

mapping_lighting_scenario_daylight___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_daylight___4.factor = factor(data$lighting_scenario_daylight___4, levels = names(mapping_lighting_scenario_daylight___4), labels = mapping_lighting_scenario_daylight___4)

mapping_lighting_scenario_3___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_3___1.factor = factor(data$lighting_scenario_3___1, levels = names(mapping_lighting_scenario_3___1), labels = mapping_lighting_scenario_3___1)

mapping_lighting_scenario_3___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_3___2.factor = factor(data$lighting_scenario_3___2, levels = names(mapping_lighting_scenario_3___2), labels = mapping_lighting_scenario_3___2)

mapping_lighting_scenario_3___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_3___3.factor = factor(data$lighting_scenario_3___3, levels = names(mapping_lighting_scenario_3___3), labels = mapping_lighting_scenario_3___3)

mapping_lighting_scenario_2___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_2___1.factor = factor(data$lighting_scenario_2___1, levels = names(mapping_lighting_scenario_2___1), labels = mapping_lighting_scenario_2___1)

mapping_lighting_scenario_2___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_2___2.factor = factor(data$lighting_scenario_2___2, levels = names(mapping_lighting_scenario_2___2), labels = mapping_lighting_scenario_2___2)

mapping_lighting_scenario_2___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_2___3.factor = factor(data$lighting_scenario_2___3, levels = names(mapping_lighting_scenario_2___3), labels = mapping_lighting_scenario_2___3)

mapping_lighting_scenario_2___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$lighting_scenario_2___4.factor = factor(data$lighting_scenario_2___4, levels = names(mapping_lighting_scenario_2___4), labels = mapping_lighting_scenario_2___4)

mapping_autonomy = c(
	"1" = "Yes, fully self-selected (e.g., adjusting lights at home or in a private office, moving to shaded area)",
	"2" = "Partly self-selected (e.g., some control such as opening blinds or switching a desk lamp, but not over main lighting)",
	"3" = "Not self-selected (e.g., public transport, shared office, classroom, hospital, airplane, etc.)",
	"4" = "Not applicable"
)
data$autonomy.factor = factor(data$autonomy, levels = names(mapping_autonomy), labels = mapping_autonomy)

mapping_status = c(
	"0" = "Deleted",
	"1" = "Completed",
	"2" = "Incomplete"
)
data$status.factor = factor(data$status, levels = names(mapping_status), labels = mapping_status)

mapping_log_a_new_activity_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$log_a_new_activity_complete.factor = factor(data$log_a_new_activity_complete, levels = names(mapping_log_a_new_activity_complete), labels = mapping_log_a_new_activity_complete)

mapping_complete_log = c(
	"1" = "1",
	"2" = "2",
	"3" = "3",
	"4" = "4",
	"5" = "5"
)
data$complete_log.factor = factor(data$complete_log, levels = names(mapping_complete_log), labels = mapping_complete_log)

mapping_behaviour_change = c(
	"1" = "Yes, significantly",
	"2" = "Yes, somewhat",
	"3" = "No"
)
data$behaviour_change.factor = factor(data$behaviour_change, levels = names(mapping_behaviour_change), labels = mapping_behaviour_change)

mapping_travel_time_zone = c(
	"1" = "Yes",
	"2" = "No"
)
data$travel_time_zone.factor = factor(data$travel_time_zone, levels = names(mapping_travel_time_zone), labels = mapping_travel_time_zone)

mapping_post_participation_survey_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$post_participation_survey_complete.factor = factor(data$post_participation_survey_complete, levels = names(mapping_post_participation_survey_complete), labels = mapping_post_participation_survey_complete)

mapping_device_information_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$device_information_complete.factor = factor(data$device_information_complete, levels = names(mapping_device_information_complete), labels = mapping_device_information_complete)

mapping_detailed_time_zone_changes_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$detailed_time_zone_changes_complete.factor = factor(data$detailed_time_zone_changes_complete, levels = names(mapping_detailed_time_zone_changes_complete), labels = mapping_detailed_time_zone_changes_complete)

#remove everything but the data
rm(list=ls()[-1])
