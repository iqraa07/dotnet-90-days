# Day 07: Checkpoint 1: To-Do Console App

- **Updated:** 2026-11-16
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Exercise

This small To-Do app adds, completes, and removes tasks. The same list view can display all tasks or only unfinished ones. IDs stay stable during the session.

The program keeps tasks in a `List<TodoItem>`. The pending view skips items whose `Complete` flag is set. The data lasts for one run. The Week 1 reflection remains open in the journal.

## Verification

The Release build passed. [All 5 CLI checks](../assets/progress/day-07-checks.txt) passed. See the [recorded example](../days/day-07/README.md).

## What I understood

<!-- Write this reflection in your own words. -->
-

## Review questions

1. Why keep a task ID separate from its position?
2. How does the pending view decide which tasks to skip?
3. Which first-week concept did this exercise bring together with lists?
