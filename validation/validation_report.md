# Reproducible data audit

Generated: 2026-07-28 15:15:02 UTC

## Reconciled counts

- 52 survey record IDs.
- 50 wearable logger exports and 50 device-information records.
- 47 included participants spanning 15 countries, 17 IANA time-zone identifiers and 10 UTC offsets.
- 1827 raw activity-log entries; 1763 linked entries; 64 excluded or unlinked entries.
- 28203 legacy five-minute dashboard rows.
- 141,000 one-minute release-grid rows: 140,954 observed and 46 explicit gaps.

## Release decision

The participant-level archive is included in the dataset release. The ActTrust semantics, duplicate-key rule, exclusion mismatch, Malaysian timestamp correction, one-decimal location rule and opaque dated-flight linkage are resolved in the release workflow. No separate standalone consent was collected; TUM determined that the implicit researcher-event agreement permits the pseudonymised CC BY 4.0 release, and the formal institutional waiver is documented in the Data Note. The archive passed 19 exact-file checks with zero failures and 2 residual-risk warnings. The authors approved the archive, documented residual risk, licence and publication.

## Interpretation rule

The ActTrust LIGHT channel is photopic illuminance. It must not be described or released as melanopic equivalent daylight illuminance.
