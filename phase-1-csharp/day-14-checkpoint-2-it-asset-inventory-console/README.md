# Day 14: Checkpoint 2: IT Asset Inventory Console

Manage IT assets in memory. Add assets, list them, search by name or location, and filter assets more than four years old.

## Run

From the repository root in PowerShell:

```powershell
dotnet build .\phase-1-csharp\day-14-checkpoint-2-it-asset-inventory-console -c Release
@('add|Notebook|Makassar|2020-03-01', 'add|Dock|Jakarta|2022-11-16', 'search|name|book', 'older|2026-11-16', 'quit') | dotnet run --project .\phase-1-csharp\day-14-checkpoint-2-it-asset-inventory-console -c Release --no-build
```

The sample adds a notebook and dock. Name search finds the notebook, and the age filter returns the same asset. The dock was purchased exactly four years before the reporting date.

## How it works

The console handles commands while `AssetInventory` owns the asset list and queries. Use `DateOnly` to record a purchase without a time of day, and supply a reporting date for the age filter.

| Command | Example |
|---|---|
| Add an asset | `add\|Notebook\|Makassar\|2020-03-01` |
| List all assets | `list` |
| Find an asset by name | `search\|name\|book` |
| Find assets by location | `search\|location\|Makassar` |
| Find older assets on a reporting date | `older\|2026-11-16` |
| Exit | `quit` |

Use `YYYY-MM-DD` for dates. Name and location searches match substrings without regard to case. For the date `2026-11-16`, the age filter selects purchases before `2022-11-16`. A purchase on the cutoff date is exactly four years old.

## Verification

The Release build passed with 0 warnings and 0 errors. The four checks cover add/list/search, case-insensitive matching, the age boundary, and invalid dates with empty results.

[CLI checks](../../assets/progress/day-14-checks.txt) · [Run transcript](../../assets/progress/day-14-output.txt) · [Daily overview](../../days/day-14/README.md) · [Journal](../../journal/day-14-checkpoint-2-it-asset-inventory-console.md)
