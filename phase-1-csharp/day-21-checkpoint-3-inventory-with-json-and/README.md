# Day 21: Checkpoint 3: Inventory with JSON and Reports

The inventory console keeps Day 14's add, list, search, and age-filter commands. It saves additions to JSON and reports counts by location.

## Run from the repository root

```powershell
@('reports', 'reports | location', 'reports | total', 'quit') | dotnet run --project .\phase-1-csharp\day-21-checkpoint-3-inventory-with-json-and -c Release
```

The bundled inventory reports `Gowa: 1`, `Makassar: 2`, and `Total assets: 3`.

## Implementation

On its first run the program reads [assets.sample.json](assets.sample.json). `add` writes `inventory.json` in the build output's `data` folder. Later runs load the saved inventory. To use a separate JSON file, pass its path after `--`. The sample stays available for fresh runs.

| Command | Result |
| --- | --- |
| `add \| Router \| Gowa \| 2019-12-01` | Add an asset and save the inventory. |
| `list` | Show every asset. |
| `search \| name \| route` | Match names without case sensitivity. Use `location` to search places. |
| `older \| 2026-11-16` | Show assets purchased more than four years before the given date. |
| `reports` | Show report choices. |
| `reports \| location` | Group location names without case sensitivity and count the assets in each group. |
| `reports \| total` | Show the total number of assets. |
| `quit` | End the session. |

Start the program without the input pipeline for an interactive session.

[Daily overview and run evidence](../../days/day-21/README.md) · [Learning journal](../../journal/day-21-checkpoint-3-inventory-with-json-and.md)
