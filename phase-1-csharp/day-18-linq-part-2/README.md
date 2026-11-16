# Day 18: LINQ Part 2

Report sample tickets by category and status, then calculate average resolution time by priority.

## Run

From the repository root in PowerShell:

```powershell
dotnet build .\phase-1-csharp\day-18-linq-part-2 -c Release
dotnet run --project .\phase-1-csharp\day-18-linq-part-2 -c Release --no-build
```

The report prints totals by category and status, resolution summary statistics, and an average of 3.0, 12.0, and 20.0 hours for Urgent, Normal, and Low respectively.

## How it works

The category report uses query syntax. The status table and average report use method syntax. A join pairs each resolved priority group with its target resolution time.

The program runs against eight sample tickets. It groups all tickets for the category and status reports, then uses tickets with recorded resolution hours for `Sum`, `Max`, and `Average`.

| Priority | Average resolved hours | Target hours |
|---|---:|---:|
| Urgent | 3.0 | 4 |
| Normal | 12.0 | 12 |
| Low | 20.0 | 24 |

The sample contains five resolved tickets and three open tickets. The resolved hours total 50, and the longest resolution took 20 hours.

## Verification

The Release build passed with 0 warnings and 0 errors. One CLI run checked all category and status counts, total and maximum resolved hours, and the three joined priority averages.

[CLI checks](../../assets/progress/day-18-checks.txt) · [Run transcript](../../assets/progress/day-18-output.txt) · [Daily overview](../../days/day-18/README.md) · [Journal](../../journal/day-18-linq-part-2.md)
