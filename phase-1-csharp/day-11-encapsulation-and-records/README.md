# Day 11: Encapsulation and Records

Use ticket methods to control status changes and keep an earlier record snapshot.

## Run

Use PowerShell from the repository root.

```powershell
dotnet run --project .\phase-1-csharp\day-11-encapsulation-and-records -c Release
```

The ticket moves from `Open` to `InProgress` to `Closed`. Reopening raises `InvalidOperationException`, and the saved snapshot still shows `Open`.

## Implementation

[Ticket.cs](Ticket.cs) keeps the status setter private so callers use `Start`, `Close`, or `Reopen`. Closing a ticket is permanent. The subject setter trims the text and rejects a blank value before storing it.

`TicketSnapshot` is a record with init-only positional properties. Its members here are a number, a string, and an enum value. A `with` expression creates a modified copy.

## Verification

The Release build passed with zero warnings and zero errors. See the [sample run](../../assets/progress/day-11-output.txt) and [independent checks](../../assets/progress/day-11-checks.txt).

[Daily overview](../../days/day-11/README.md) · [Journal](../../journal/day-11-encapsulation-and-records.md)
