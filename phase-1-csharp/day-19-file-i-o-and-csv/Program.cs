string inputPath = args.Length > 0 ? args[0] : Path.Combine(AppContext.BaseDirectory, "assets.csv");
string? reportPath = args.Length > 1 ? args[1] : null;

try
{
    string[] lines = File.ReadAllLines(inputPath);
    if (lines.Length == 0 || lines[0] != "Id,Name,Location")
    {
        Console.Error.WriteLine("Expected the CSV header Id,Name,Location.");
        return 1;
    }

    var report = new List<string> { $"{"ID",4}  {"Name",-16} Location" };
    int skipped = 0;

    for (int index = 1; index < lines.Length; index++)
    {
        string[] fields = lines[index].Split(',', StringSplitOptions.TrimEntries);
        if (fields.Length != 3 || !int.TryParse(fields[0], out int id) || id <= 0
            || fields[1].Length == 0 || fields[2].Length == 0)
        {
            report.Add($"Skipped row {index + 1}: expected a positive ID, name, and location.");
            skipped++;
            continue;
        }

        report.Add($"{id,4}  {fields[1],-16} {fields[2]}");
    }

    report.Add($"Imported {lines.Length - 1 - skipped}; skipped {skipped}.");
    foreach (string line in report)
    {
        Console.WriteLine(line);
    }

    if (reportPath is not null)
    {
        string fullReportPath = Path.GetFullPath(reportPath);
        if (Path.GetFullPath(inputPath).Equals(fullReportPath, StringComparison.OrdinalIgnoreCase))
        {
            Console.Error.WriteLine("The report must use a different path from the CSV.");
            return 1;
        }

        Directory.CreateDirectory(Path.GetDirectoryName(fullReportPath)!);
        File.WriteAllText(fullReportPath, string.Join(Environment.NewLine, report) + Environment.NewLine);
    }

    return 0;
}
catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
{
    Console.Error.WriteLine($"File error: {exception.Message}");
    return 1;
}
