# Day 21: Checkpoint 3: Inventory with JSON and Reports

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-21-checkpoint-3-inventory-with-json-and)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Extend the Day 14 console with persistent inventory and a report that counts assets at each location.

## Work completed

- [x] Kept the Day 14 commands and saved additions to JSON.
- [x] Verified that a second process reloaded a saved asset and included it in search and reports.
- [x] Checked mixed-case locations, an empty report, invalid dates, and malformed saved JSON.
- [x] Built Release with 0 warnings and 0 errors.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->

## Week 3 reflection

Pending. Compare the in-memory inventory with the persisted version, then record what changed when using collections, LINQ, and files.

## Understanding check

1. Which file is read before the first asset is saved?
2. Why do `Makassar` and `makassar` appear in the same group?
3. What would change if the location report grouped by name before counting?

## Evidence

[Day 21 overview](../days/day-21/README.md) · [Run transcript](../assets/progress/day-21-output.txt) · [CLI checks](../assets/progress/day-21-checks.txt)

## Next session

Try adding an asset and comparing the location report before and after restarting the program. Day 22 covers custom exceptions.
