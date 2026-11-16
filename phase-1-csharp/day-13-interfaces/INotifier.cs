internal interface INotifier
{
    void Notify(string message);
}

internal sealed class ConsoleNotifier : INotifier
{
    public void Notify(string message) => Console.WriteLine($"Console: {message}");
}

internal sealed class FileNotifier(string directory) : INotifier
{
    public void Notify(string message)
    {
        Directory.CreateDirectory(directory);
        File.AppendAllText(Path.Combine(directory, "day-13-notifications.log"), message + Environment.NewLine);
        Console.WriteLine("File: Message appended to day-13-notifications.log.");
    }
}

internal sealed class TelegramNotifierFake : INotifier
{
    public void Notify(string message) => Console.WriteLine($"Telegram (simulated): {message}");
}
