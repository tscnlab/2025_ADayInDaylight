# Sanitised structured questionnaire instrument

Status: **public instrument documentation; no participant responses included**

## Scope and provenance

This instrument documents the structured contextual questions represented in the released `events.csv` table. It was transcribed and normalised from the repository’s blank eight-page REDCap instrument export, `survey/ADayInDaylight.pdf`, generated on 15 October 2025. The source PDF is marked **Confidential** and also contains prompts for direct identifiers, free text, exact location, travel details, device identifiers and mobile-app payloads. It is excluded from the public release.

The response labels below describe the public coded interface, not participant answers. Obvious spelling variants in the source form are normalised. Coded `Other` responses are retained only as controlled categories following linkage-risk review; every accompanying narrative is excluded.

## Contextual activity-log instrument

### Logger state

1. **Are you wearing the light logger at the moment?**  
   Release variable: `wear_state`  
   Choices: `Wear`; `Non-wear`; `Bedtime`.

2. **Are you alone or with others?**  
   Release variable: `social_context`  
   Choices: `Alone`; `With others`.

3. **What activity are you doing while wearing the logger?**  
   Release variable: `wear_activity`  
   Choices: `Sedentary`; `Light activity`; `Moderate activity`; `High-intensity activity`.

4. **Where is the logger during non-wear?**  
   Release variable: `nonwear_storage`  
   Choices: `Stationary dark place`; `Mobile dark place`; `Surface with varying light exposure`; `Other`.

5. **Where is the logger during sleep?**  
   Release variable: `nighttime_position`  
   Choices: `Facing upward on bedside table`; `Facing downward on bedside table`; `Other`.

### Setting

6. **Select the setting.**  
   Release variable: `setting`  
   Choices: `Indoors`; `Outdoors`; `Mixed`; `Bed`; `Non-wear`. The final two states are derived from the logger-state branch.

7. **Select the broad indoor or outdoor setting.**  
   Release variable: `setting_location`  
   Choices: `Home`; `Working space`; `Learning facility`; `Retail, food or services facility`; `Health facility`; `Leisure space`; `Other`.

8. **Select the more specific setting, where applicable.**  
   Release variable: `setting_specific`  
   Normalised coded choices cover home rooms; office, learning, retail, health and leisure spaces; semi-open architectural spaces; and transport modes. The released categories passed small-cell and linkage-risk review. Any explanatory text attached to `Other` is excluded.

### Lighting and screens

9. **Select the daylight condition.**  
   Release variable: `daylight_condition`  
   Choices: `Direct sunlight`; `Shade/cloudy`; `Near a window`; `Away from window`.

10. **Select the electric-light condition.**  
    Release variable: `electric_light_condition`  
    Choices: `Lights on`; `Dim light`; `Lights off`.

11. **Select any screens in use.**  
    Release variables: `screen_phone`, `screen_tablet`, `screen_computer`, `screen_television`  
    Multi-select choices: `Smartphone`; `Tablet`; `Computer`; `Television`. Each choice is released as a Boolean indicator.

12. **Were the lighting conditions self-selected?**  
    Release variable: `lighting_autonomy`  
    Choices: `Yes`; `Partly`; `No`; `Not applicable`.

## Source fields excluded or transformed

The public instrument and participant-level tables apply the following rules:

- exact age and sex assigned at birth are retained in `participant_metadata.csv` under the author-approved release rule; email addresses are excluded;
- all open-ended comments, behaviour-change narratives, logging-difficulty narratives and other feedback;
- city and the source city/country free-text response are excluded; cleaned country is retained and exact latitude/longitude are replaced by coordinates rounded to one decimal place;
- minute-resolution time-zone travel intervals and their start/end IANA zones are retained in `travel_segments.csv`; raw flight numbers are replaced by opaque dated-flight identifiers that preserve same-flight linkage without revealing the number;
- source participant codes, device IDs, UUIDs and source record identifiers;
- install, schedule and app-status fields, supplemental JSON and serialised result payloads; and
- the raw detailed time-zone-change form and every source-to-release or flight-number crosswalk.

The post-participation survey is not released as a row-level survey table. Approved transformed fields appear only in `participant_metadata.csv` and `travel_segments.csv`. Exact age, sex assigned at birth, coordinates and exact times remain potentially identifying when combined with the light and event sequences. Country, one-decimal coordinates, exact age and sex at birth make 45 of 47 included contributor profiles unique; the exact-archive privacy review documents and accepts this residual risk.

## Author verification

Author review compared this sanitised instrument with the source form and exact coded data, confirmed the normalised labels and released `setting_specific` categories, and verified that no excluded narrative or identifier field is present.
