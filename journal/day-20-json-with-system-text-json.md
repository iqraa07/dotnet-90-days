# Day 20: JSON with System.Text.Json

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-20-json-with-system-text-json)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Serialize and deserialize typed inventory data, then retain a backup on every successful save.

## Work completed

- [x] Mapped inventory properties to JSON field names and checked required values on load.
- [x] Verified that the first save created both files and that a later save kept the previous inventory as the backup.
- [x] Confirmed a negative quantity and malformed JSON preserved both file hashes.
- [x] Built Release with 0 warnings and 0 errors.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->

## Understanding check

1. Which C# property produces the `asset_id` JSON field?
2. What is stored in the backup after the second successful save?
3. What would the program lose if it overwrote unreadable inventory with demo data?

## Evidence

[Day 20 overview](../days/day-20/README.md) · [Run transcript](../assets/progress/day-20-output.txt) · [CLI checks](../assets/progress/day-20-checks.txt)

## Next session

Change the quantity twice and compare the two JSON files. Day 21 adds persistence and reports to the inventory console.
