# Exact-archive privacy and linkage-risk review

Review date: 28 July 2026

Overall result: **PASS WITH DOCUMENTED RESIDUAL RISK**

The released archive contains four participant-data files, 22,200,827 bytes in total. The review found 0 blocking failure(s) and 2 documented residual-risk warning(s).

## Decision

No direct identifiers, source device or REDCap identifiers, raw flight numbers, city values, raw logger filenames, local paths or email addresses were detected. The approved schema, table linkage, one-minute grid, channel semantics, Malaysian timestamp correction and opaque flight grouping passed exact-file checks.

The archive remains pseudonymised rather than anonymous. Exact timestamps and event sequences are highly distinguishing; 33 contributors occupy singleton one-decimal coordinate cells, 22 have singleton exact ages, and 45 of 47 have unique country–coordinate–age–sex profiles. These are known consequences of the author-approved exact-age, sex-at-birth and one-decimal-location release rule. The authors accepted these documented risks, and the review supports public release of the archive.

TUM determined that publication of the transformed dataset under CC BY 4.0 is permissible. The formal institutional waiver and participant-sharing basis are documented in the Data Note.

## Exact checks

| Check | Domain | Status | Observed | Criterion |
|---|---|---|---:|---|
| E01 | schema | PASS | 15/20/14/9 | Exact approved columns in all four participant tables |
| E02 | direct identifiers | PASS | 0 | Zero forbidden source or identifier field names |
| E03 | direct identifiers | PASS | 0 | Zero email addresses |
| E04 | source provenance leakage | PASS | 0 | Zero local paths or raw logger filenames |
| E05 | source identifiers | PASS | 0 | Zero source device or record identifiers |
| E06 | travel privacy | PASS | 0 | Zero raw or normalised flight numbers |
| E07 | location privacy | PASS | 0 | Zero cleaned city values |
| E08 | pseudonymous linkage | PASS | 0 | All participant identifiers match the opaque release pattern |
| E09 | pseudonymous linkage | PASS | 0 | All flight identifiers match the opaque dated-flight pattern |
| E10 | relational integrity | PASS | 47/47/47/3 | 47 light IDs; all event and travel IDs represented in participant metadata |
| E11 | light-grid integrity | PASS | 141000/140954/46/0 | 141000 rows; 140954 observed; 46 explicit gaps; 0 duplicate keys |
| E12 | measurement semantics | PASS | 0 | Zero ActTrust rows labelled as melanopic EDI |
| E13 | timestamp provenance | PASS | 1/3000/-115200 | One corrected Malaysian stream; 3000 rows; -115200 seconds |
| E14 | event integrity | PASS | 1763/0 | 1763 event rows; zero negative durations |
| E15 | location transform | PASS | 38 | Coordinates have at most one decimal place |
| E16 | residual linkage risk | WARNING | 33/22/45 | Document singleton coordinate, age and combined profiles |
| E17 | residual linkage risk | WARNING | 47 | Quantify distinct exact event-sequence signatures |
| E18 | travel integrity | PASS | 3/2/2 | Three rows; two opaque dated-flight groups; largest group two |
| E19 | publication boundary | PASS | TRUE | The participant-data directory contains exactly the four approved public tables |

## Runtime and provenance

- R: R version 4.5.0 (2025-04-11)
- tidyverse: 2.0.0
- digest: 0.6.39
- Archive-level SHA-256 values are supplied in `checksums.sha256`.
- Confidential participant/flight crosswalk material and the HMAC salt are absent from the released archive and this review.

