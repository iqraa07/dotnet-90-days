# Day 18: LINQ Part 2

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Implementation:** complete and verified
- **Personal reflection:** pending
- **Source:** [Console project](../phase-1-csharp/day-18-linq-part-2)

## Today's goals

Report sample tickets by category and status, then calculate average resolution time by priority.

## Work completed

The category report uses query syntax. The status table and average report use method syntax. A join pairs each resolved priority group with its target resolution time.

The Release build passed with 0 warnings and 0 errors. One CLI run checked all category and status counts, total and maximum resolved hours, and the three joined priority averages. [Check transcript](../assets/progress/day-18-checks.txt)

## What I understood

<!-- Write this reflection in your own words. -->
-

## Understanding check

1. Which tickets should count toward the priority averages?
2. What does the join add to a grouped priority result?
3. How would a missing resolution time affect the average if it were treated as zero?

## Next session

Add one resolved sample ticket and predict which counts and averages will change before running the report.
