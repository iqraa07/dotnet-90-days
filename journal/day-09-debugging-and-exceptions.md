# Day 09: Debugging and Exceptions

- **Date:** 2026-11-16
- **Source:** [Console project](../phase-1-csharp/day-09-debugging-and-exceptions)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Work completed

- Reproduced three deliberate defects in separate Debug builds and used diagnostic output and stack traces to identify the failing operations.
- Verified the fixed Release app with signed values, a sum above the 32-bit range, invalid entries, empty input, and EOF.
- Recorded a successful sample and eleven checks, including the three isolated reproductions.
- Built Release with zero warnings and zero errors.

## What I understood

<!-- Add your reflection in your own words. -->
-

## Understanding check

1. Why does the last valid index equal `values.Length - 1`?
2. Where does C# truncate `sum / values.Length` when both operands are integers?
3. When does `finally` run if the `catch` block returns an exit code?

## Evidence

[Day 09 overview](../days/day-09/README.md) · [Sample run](../assets/progress/day-09-output.txt) · [Independent checks](../assets/progress/day-09-checks.txt)
