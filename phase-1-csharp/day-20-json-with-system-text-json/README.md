# Day 20: JSON with System.Text.Json

The program saves inventory as JSON, keeps a backup, then reloads the file and prints the stored quantities.

## Run from the repository root

```powershell
'5' | dotnet run --project .\phase-1-csharp\day-20-json-with-system-text-json -c Release
```

Enter `5` to save and reload a laptop quantity of 5.

## Implementation

`InventoryStore` reads and writes `inventory.json` in the build output's `data` folder. Pass a directory after `--` to keep files elsewhere. `inventory.sample.json` shows the shape of the demo data.

`JsonSerializerOptions.WriteIndented` keeps the file readable. `JsonPropertyName` maps the C# ID property to `asset_id`. On the first save the backup matches the new inventory. On later saves it contains the previous inventory. The program stages the new JSON before replacing the existing file.

Enter a nonnegative integer to update the laptop quantity. Blank input keeps the stored value. Invalid input or invalid JSON returns an error and preserves both files.

[Daily overview and run evidence](../../days/day-20/README.md) · [Learning journal](../../journal/day-20-json-with-system-text-json.md)
