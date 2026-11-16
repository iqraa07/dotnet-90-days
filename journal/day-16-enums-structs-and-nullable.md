# Day 16: Enums, Structs and Nullable

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Implementation:** complete and verified
- **Personal reflection:** pending
- **Source:** [Console project](../phase-1-csharp/day-16-enums-structs-and-nullable)

## Today's goals

Look up a sample helpdesk ticket by ID using status and priority enums, a value-type key, and a nullable return.

## Work completed

`TicketKey` is a small immutable value type. `Ticket` is a reference type, so `FindTicket` can return `Ticket?` when the ID is missing. The caller checks for null before printing the record.

The Release build passed with 0 warnings and 0 errors. The four checks cover assigned and unassigned tickets, an unknown ID followed by a valid lookup, invalid IDs, and EOF. [Check transcript](../assets/progress/day-16-checks.txt)

## What I understood

<!-- Write this reflection in your own words. -->
-

## Understanding check

1. Why is the ticket key a value type?
2. How can the caller tell that `FindTicket` found no ticket?
3. What does `?.Trim() ?? "Unassigned"` do when the assignee is null?

## Next session

Try an unknown ticket ID, then a known ID. Record what each branch handles.
