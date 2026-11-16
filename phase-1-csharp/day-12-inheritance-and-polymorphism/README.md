# Day 12: Inheritance and Polymorphism

Call a different maintenance rule for each device through one base class.

## Run

Use PowerShell from the repository root.

```powershell
dotnet run --project .\phase-1-csharp\day-12-inheritance-and-polymorphism -c Release
```

The sample recommends replacing the laptop battery, reviewing the router firmware, and replacing the printer toner.

## Implementation

[Device.cs](Device.cs) defines an abstract `Device` that stores a name and location. Each sealed subtype overrides `GetMaintenanceInfo()`. [Program.cs](Program.cs) then iterates over a `Device[]` and calls the same method on each object.

| Device | Rule that triggers action |
| --- | --- |
| Laptop | Battery health below 80% |
| Router | At least 30 days since the firmware review |
| Printer | Toner level at or below 15% |

## Verification

The Release build passed with zero warnings and zero errors. See the [sample run](../../assets/progress/day-12-output.txt) and [independent checks](../../assets/progress/day-12-checks.txt).

[Daily overview](../../days/day-12/README.md) · [Journal](../../journal/day-12-inheritance-and-polymorphism.md)
