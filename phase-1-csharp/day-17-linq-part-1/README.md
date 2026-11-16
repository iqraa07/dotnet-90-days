# Day 17: LINQ Part 1

Run five LINQ queries against 30 reproducible sample assets.

## Run

From the repository root in PowerShell:

```powershell
dotnet build .\phase-1-csharp\day-17-linq-part-1 -c Release
dotnet run --project .\phase-1-csharp\day-17-linq-part-1 -c Release --no-build
```

The program prints 30 sample assets by count, four matching Makassar laptop IDs in purchase order, the first Jakarta router, type counts, predicate results, and the second page.

## How it works

Filter with `Where`, sort before projecting with `Select`, use `FirstOrDefault` for a lookup with a possible empty result, and order by ID before paging with `Skip` and `Take`.

The program creates 30 in-memory assets and runs the queries without input.

| Query | Example result |
|---|---|
| Oldest first among Makassar laptops bought before 2022 | `A01`, `A10`, `A19`, `A28` |
| First Jakarta router | `A06` |
| Count each asset type | 10 laptops, 10 monitors, 10 routers |
| Check for a pre-2020 router and verify all IDs are positive | Both checks return `True` |
| Second page ordered by ID | `A06` to `A10` |

Use `First()` when a match is guaranteed and `FirstOrDefault()` when an empty result needs handling.

## Verification

The Release build passed with 0 warnings and 0 errors. One CLI run checked the exact expected output for all five query sections.

[CLI checks](../../assets/progress/day-17-checks.txt) · [Run transcript](../../assets/progress/day-17-output.txt) · [Daily overview](../../days/day-17/README.md) · [Journal](../../journal/day-17-linq-part-1.md)
