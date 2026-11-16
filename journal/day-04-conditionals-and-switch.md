# Day 04: Conditionals and Switch

- **Updated:** 2026-11-16
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Exercise

The program reads an incident's impact and urgency as `low`, `medium`, or `high`. It maps the combination to a priority and uses a switch expression to choose a resolution target.

High impact and high urgency produce P1. High + medium produces P2. Low + low produces P4. The remaining combinations produce P3. The example targets are P1 = 4 hours, P2 = 8 hours, P3 = 24 hours, and P4 = 48 hours.

## Verification

The Release build passed. [All 6 CLI checks](../assets/progress/day-04-checks.txt) passed. See the [recorded example](../days/day-04/README.md).

## What I understood

<!-- Write this reflection in your own words. -->
-

## Review questions

1. Which combinations reach the first branch?
2. Why does the order of the conditions matter?
3. Where would you change just the P2 target?
