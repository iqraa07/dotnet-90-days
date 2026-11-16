# Day 17: LINQ Part 1

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Implementation:** complete and verified
- **Personal reflection:** pending
- **Source:** [Console project](../phase-1-csharp/day-17-linq-part-1)

## Today's goals

Run five LINQ queries against 30 reproducible sample assets.

## Work completed

Filter with `Where`, sort before projecting with `Select`, use `FirstOrDefault` for a lookup with a possible empty result, and order by ID before paging with `Skip` and `Take`.

The Release build passed with 0 warnings and 0 errors. One CLI run checked the exact expected output for all five query sections. [Check transcript](../assets/progress/day-17-checks.txt)

## What I understood

<!-- Write this reflection in your own words. -->
-

## Understanding check

1. Why does `OrderBy` run before `Skip` and `Take`?
2. How does `FirstOrDefault` let a caller handle a missing router?
3. Which predicate checks all assets, and which needs only one match?

## Next session

Change the year cutoff in the first query and check how the list changes.
