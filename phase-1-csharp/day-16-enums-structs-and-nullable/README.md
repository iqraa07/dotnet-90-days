# Day 16: Enums, Structs and Nullable

Look up a sample helpdesk ticket by ID using status and priority enums, a value-type key, and a nullable return.

## Run

From the repository root in PowerShell:

```powershell
dotnet build .\phase-1-csharp\day-16-enums-structs-and-nullable -c Release
@('1', '2', '999', 'quit') | dotnet run --project .\phase-1-csharp\day-16-enums-structs-and-nullable -c Release --no-build
```

The sample prints the assigned ticket, shows `Unassigned` for ticket 2, and reports that ticket 999 is missing.

## How it works

`TicketKey` is a small immutable value type. `Ticket` is a reference type, so `FindTicket` can return `Ticket?` when the ID is missing. The caller checks for null before printing the record.

The sample data includes ticket `1` with an assignee, ticket `2` without one, and ticket `3` in progress. Enter an ID or `quit`. Invalid input shows a message and keeps the lookup open.

`Ticket?` and `string?` signal that a value can be null. `?.` calls `Trim()` only when an assignee exists, and `??` supplies `Unassigned` otherwise. The null-forgiving operator `!` tells the compiler that the caller knows a value is present. Here the explicit null check gives the compiler that information.

## Verification

The Release build passed with 0 warnings and 0 errors. The four checks cover assigned and unassigned tickets, an unknown ID followed by a valid lookup, invalid IDs, and EOF.

[CLI checks](../../assets/progress/day-16-checks.txt) · [Run transcript](../../assets/progress/day-16-output.txt) · [Daily overview](../../days/day-16/README.md) · [Journal](../../journal/day-16-enums-structs-and-nullable.md)
