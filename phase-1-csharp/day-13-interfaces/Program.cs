Console.WriteLine("Choose a notifier (console, file, telegram):");
INotifier? notifier = Console.ReadLine()?.Trim().ToLowerInvariant() switch
{
    "console" => new ConsoleNotifier(),
    "file" => new FileNotifier(Path.Combine(Path.GetTempPath(), "dotnet-90-days")),
    "telegram" => new TelegramNotifierFake(),
    _ => null
};

if (notifier is null)
{
    Console.Error.WriteLine("Choose console, file, or telegram.");
    return 1;
}

Console.WriteLine("Enter a message:");
string? message = Console.ReadLine()?.Trim();
if (string.IsNullOrEmpty(message))
{
    Console.Error.WriteLine("Enter a nonempty message.");
    return 1;
}

try
{
    notifier.Notify(message);
}
catch (IOException)
{
    Console.Error.WriteLine("Could not write the notification log.");
    return 1;
}
catch (UnauthorizedAccessException)
{
    Console.Error.WriteLine("Could not write the notification log.");
    return 1;
}

return 0;
