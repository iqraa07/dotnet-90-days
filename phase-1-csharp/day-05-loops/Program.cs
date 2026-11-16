const int AttemptLimit = 7;
string? targetText = Environment.GetEnvironmentVariable("GUESS_TARGET");
int? fixedTarget = null;
if (targetText is not null)
{
    if (!int.TryParse(targetText, out int value) || value is < 1 or > 100)
    {
        Console.Error.WriteLine("GUESS_TARGET must be a whole number from 1 to 100.");
        return 1;
    }

    fixedTarget = value;
}

do
{
    int target = fixedTarget ?? Random.Shared.Next(1, 101);
    bool guessed = false;
    int remaining = AttemptLimit;

    while (remaining > 0)
    {
        Console.WriteLine("Guess (1-100):");
        string? input = Console.ReadLine();
        if (input is null)
        {
            return 0;
        }

        if (!int.TryParse(input, out int guess) || guess is < 1 or > 100)
        {
            Console.WriteLine("Enter a whole number from 1 to 100.");
            continue;
        }

        remaining--;
        if (guess == target)
        {
            Console.WriteLine($"Correct. Attempts remaining: {remaining}.");
            guessed = true;
            break;
        }

        string hint = guess < target ? "Higher." : "Lower.";
        Console.WriteLine($"{hint} Attempts remaining: {remaining}");
    }

    if (!guessed)
    {
        Console.WriteLine($"Out of attempts. The number was {target}.");
    }
} while (PlayAgain());

return 0;

static bool PlayAgain()
{
    while (true)
    {
        Console.WriteLine("Play again (y/n)?");
        string? answer = Console.ReadLine()?.Trim().ToLowerInvariant();
        switch (answer)
        {
            case "y":
                return true;
            case "n":
            case null:
                return false;
            default:
                Console.WriteLine("Enter y or n.");
                break;
        }
    }
}
