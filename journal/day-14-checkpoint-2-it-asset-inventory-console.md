# Day 14: Checkpoint 2: IT Asset Inventory Console

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Implementation:** complete and verified
- **Personal reflection:** pending
- **Source:** [Console project](../phase-1-csharp/day-14-checkpoint-2-it-asset-inventory-console)

## Today's goals

Manage IT assets in memory. Add assets, list them, search by name or location, and filter assets more than four years old.

## Work completed

The console handles commands while `AssetInventory` owns the asset list and queries. Use `DateOnly` to record a purchase without a time of day, and supply a reporting date for the age filter.

The Release build passed with 0 warnings and 0 errors. The four checks cover add/list/search, case-insensitive matching, the age boundary, and invalid dates with empty results. [Check transcript](../assets/progress/day-14-checks.txt)

## What I understood

<!-- Write this reflection in your own words. -->
-

## Understanding check

1. Why does the console delegate searches to `AssetInventory`?
2. Why does the cutoff use `<` rather than `<=`?
3. Which fields stay meaningful if the application records purchases in another time zone?

## Next session

The Week 2 reflection is pending. Record your own notes about the inventory classes, the age cutoff, and one improvement to the exercise.
