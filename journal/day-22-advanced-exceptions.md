# Day 22: Advanced Exceptions

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-22-advanced-exceptions)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Use guard clauses and a custom exception to enforce ticket state and device validation.

## Work completed

- [x] Verified valid transitions, premature close, repeated start, and actions on a closed ticket.
- [x] Confirmed the exception filter explains how to close an open ticket.
- [x] Checked blank ticket subjects and device names, invalid IP text, and valid device and ticket input.
- [x] Built Release with 0 warnings and 0 errors.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->

## Understanding check

1. Why does closing an open ticket leave its current state intact?
2. Which two properties does the exception filter read?
3. What happens to the original stack trace if a catch block uses a bare `throw;`?

## Evidence

[Day 22 overview](../days/day-22/README.md) · [Run transcript](../assets/progress/day-22-output.txt) · [CLI checks](../assets/progress/day-22-checks.txt)

## Next session

Try starting a ticket a second time and compare that message with closing it before starting. Day 23 covers generics.
