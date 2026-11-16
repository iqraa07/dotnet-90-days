# Day 19: File I/O and CSV

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-19-file-i-o-and-csv)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Read an asset CSV, skip malformed rows, and write a text report on request.

## Work completed

- [x] Parsed valid rows and reported the original line numbers of skipped rows.
- [x] Verified that the saved report matched the console output.
- [x] Checked missing input, incorrect headers, and an attempt to write the report over its input.
- [x] Built Release with 0 warnings and 0 errors.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->

## Understanding check

1. Why does the displayed row number use `index + 1`?
2. When would a `StreamReader` be preferable to `File.ReadAllLines`?
3. What changes would let a location contain a comma?

## Evidence

[Day 19 overview](../days/day-19/README.md) · [Run transcript](../assets/progress/day-19-output.txt) · [CLI checks](../assets/progress/day-19-checks.txt)

## Next session

Try a new CSV with a missing location. Day 20 stores inventory in JSON.
