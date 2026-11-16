# Day 13: Interfaces

Select a console, file, or simulated Telegram notifier at runtime.

## Run

Use PowerShell from the repository root.

```powershell
@('telegram', 'Inventory review at 10:00.') | dotnet run --project .\phase-1-csharp\day-13-interfaces -c Release
```

The sample prints `Telegram (simulated): Inventory review at 10:00.`

## Implementation

[INotifier.cs](INotifier.cs) declares one `Notify(string message)` method. [Program.cs](Program.cs) maps the user choice to a concrete notifier and calls it through that interface. A different implementation can be supplied where an `INotifier` is expected.

| Choice | Result |
| --- | --- |
| `console` | Writes the message to standard output. |
| `file` | Appends to `dotnet-90-days/day-13-notifications.log` under the local temporary directory. |
| `telegram` | Prints a simulation. The run makes no network request. |

Choices ignore case and surrounding whitespace. Invalid choices, missing messages, and file I/O failures produce a diagnostic and exit with code `1`.

## Verification

The Release build passed with zero warnings and zero errors. See the [sample run](../../assets/progress/day-13-output.txt) and [independent checks](../../assets/progress/day-13-checks.txt).

[Daily overview](../../days/day-13/README.md) · [Journal](../../journal/day-13-interfaces.md)
