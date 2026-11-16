# Day 23: Generics

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-23-generics)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Build a constrained generic repository and filter items with a predicate.

## Work completed

- [x] Implemented `Add`, `GetById`, `GetAll`, `Remove`, and `Find` for a dictionary-backed collection.
- [x] Verified rejection of a duplicate ID without replacing the original record.
- [x] Checked filtering, missing-item lookup, repeated removal, and an independent repository for tickets.
- [x] Built Release with 0 warnings and 0 errors.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->

## Understanding check

1. What members does the `IEntity` constraint let generic code use?
2. How does the caller describe the items that `Find` should return?
3. Why can asset ID 1 and ticket ID 1 both exist in the example?

## Evidence

[Day 23 overview](../days/day-23/README.md) · [Run transcript](../assets/progress/day-23-output.txt) · [CLI checks](../assets/progress/day-23-checks.txt)

## Next session

Change the location predicate to `Gowa` and compare the results. Day 24 covers delegates, lambdas, and events.
