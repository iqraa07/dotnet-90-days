# Day 22: Advanced Exceptions

The ticket class permits `Open → InProgress → Closed`. `InvalidTicketStateException` reports a rejected transition. The device class validates its name and IP address.

## Run from the repository root

```powershell
@('close', 'start', 'close', 'quit') | dotnet run --project .\phase-1-csharp\day-22-advanced-exceptions -c Release
```

The first `close` prints `Start the ticket before closing it.` The following `start` and `close` move the ticket to `InProgress` and then `Closed`.

## Implementation

`ArgumentNullException.ThrowIfNull` guards missing constructor arguments. The constructors also reject blank subjects and names, and `IPAddress.TryParse` checks the address.

The `when` filter handles the specific request to close an open ticket. Other invalid transitions use the exception message. A bare `throw;` in a catch block rethrows the current exception and preserves its original stack trace. `throw exception;` resets the trace origin to the rethrow site.

In an interactive session, try `device | Router | 192.0.2.10`, `device | Router | invalid`, and `ticket | Router offline`.

[Daily overview and run evidence](../../days/day-22/README.md) · [Learning journal](../../journal/day-22-advanced-exceptions.md)
