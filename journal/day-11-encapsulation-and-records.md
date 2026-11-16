# Day 11: Encapsulation and Records

- **Date:** 2026-11-16
- **Source:** [Console project](../phase-1-csharp/day-11-encapsulation-and-records)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Work completed

- Added validated subject changes and status updates through methods.
- Recorded the closed-ticket exception and the original snapshot in the console sample.
- Verified valid transitions, rejected blank subjects, blocked reopen, and record copy behavior in an isolated run.
- Built Release with zero warnings and zero errors.

## What I understood

<!-- Add your reflection in your own words. -->
-

## Understanding check

1. Why is the setter for `Status` private?
2. What partial change might happen if a setter stores an invalid subject before validating it?
3. What remains unchanged after creating a snapshot copy with `with`?

## Evidence

[Day 11 overview](../days/day-11/README.md) · [Sample run](../assets/progress/day-11-output.txt) · [Independent checks](../assets/progress/day-11-checks.txt)
