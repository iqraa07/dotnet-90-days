# Day 19: File I/O and CSV

The importer reads a CSV, prints a table of asset IDs, names, and locations, and reports malformed rows by their line number.

## Run from the repository root

```powershell
dotnet run --project .\phase-1-csharp\day-19-file-i-o-and-csv -c Release
```

The sample imports three assets and skips lines 3, 5, and 6.

## Implementation

The sample uses a fixed `Id,Name,Location` header with three unquoted fields. Each row must have a positive integer ID, a nonempty name, and a nonempty location. This parser handles simple comma-separated values. Fields containing commas or quotation marks need a parser that handles CSV quoting.

`Path.Combine` finds the bundled sample beside the build output. `File.ReadAllLines` reads and closes the source file. An optional report path uses `Directory.CreateDirectory` and `File.WriteAllText` to write the displayed table.

For a line-by-line alternative, dispose the stream with a `using` declaration.

```csharp
using StreamReader reader = File.OpenText(inputPath);
string? header = reader.ReadLine();
```

To use a different CSV and save the report, pass both paths after `--`.

```powershell
dotnet run --project .\phase-1-csharp\day-19-file-i-o-and-csv -c Release -- .\my-assets.csv .\reports\assets.txt
```

[Daily overview and run evidence](../../days/day-19/README.md) · [Learning journal](../../journal/day-19-file-i-o-and-csv.md)
