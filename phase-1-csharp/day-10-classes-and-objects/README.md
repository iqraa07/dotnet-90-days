# Day 10: Classes and Objects

Build three inventory objects with a device name, example IP address, location, and purchase date.

## Run

Use PowerShell from the repository root.

```powershell
dotnet run --project .\phase-1-csharp\day-10-classes-and-objects -c Release -- 2026-11-16
```

As of `2026-11-16`, the sample devices have `2`, `6`, and `4` completed years in service.

## Implementation

[Device.cs](Device.cs) gives each object four get-only properties set by its constructor. `ToString()` displays the name, address, and location. The age method subtracts a year when the purchase anniversary has yet to occur.

The command accepts a date in `yyyy-MM-dd` format. With no date argument, it uses the current local date. A date before the purchase produces a note in the report. For a February 29 purchase in a non-leap year, `DateOnly.AddYears` uses February 28.

## Verification

The Release build passed with zero warnings and zero errors. See the [sample run](../../assets/progress/day-10-output.txt) and [independent checks](../../assets/progress/day-10-checks.txt).

[Daily overview](../../days/day-10/README.md) · [Journal](../../journal/day-10-classes-and-objects.md)
