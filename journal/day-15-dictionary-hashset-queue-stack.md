# Day 15: Dictionary, HashSet, Queue, Stack

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Implementation:** complete and verified
- **Personal reflection:** pending
- **Source:** [Console project](../phase-1-csharp/day-15-dictionary-hashset-queue-stack)

## Today's goals

Queue helpdesk tickets in arrival order, count waiting work by category, and list resolved tickets in reverse order.

## Work completed

The queue determines which ticket comes next. The hash set tracks IDs already used in the session, the dictionary groups waiting tickets by category, and the stack keeps the most recent resolution first.

The Release build passed with 0 warnings and 0 errors. The four checks cover category counts, first-in first-out resolution, most-recent-first history, duplicate IDs, invalid commands, and empty states. [Check transcript](../assets/progress/day-15-checks.txt)

## What I understood

<!-- Write this reflection in your own words. -->
-

## Understanding check

1. Which collection prevents a ticket ID from being reused?
2. Why does `next` resolve the ticket that arrived first?
3. What should happen to the category count after the only ticket in a category is resolved?

## Next session

Try a queue with tickets in two categories. Then use `next` and check the updated category count.
