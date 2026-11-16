Console.WriteLine("Impact (low, medium, high):");
int impact = ReadLevel(Console.ReadLine());
if (impact == 0)
{
    Console.Error.WriteLine("Unknown impact. Enter low, medium, or high.");
    return 1;
}

Console.WriteLine("Urgency (low, medium, high):");
int urgency = ReadLevel(Console.ReadLine());
if (urgency == 0)
{
    Console.Error.WriteLine("Unknown urgency. Enter low, medium, or high.");
    return 1;
}

int priority;
if (impact == 3 && urgency == 3)
{
    priority = 1;
}
else if (impact + urgency == 5)
{
    priority = 2;
}
else if (impact == 1 && urgency == 1)
{
    priority = 4;
}
else
{
    priority = 3;
}

int hours = priority switch
{
    1 => 4,
    2 => 8,
    3 => 24,
    4 => 48,
    _ => throw new InvalidOperationException("Unknown priority.")
};

Console.WriteLine($"Priority: P{priority}");
Console.WriteLine($"Resolution target: {hours} hours");
return 0;

static int ReadLevel(string? text) => text?.Trim().ToLowerInvariant() switch
{
    "low" => 1,
    "medium" => 2,
    "high" => 3,
    _ => 0
};
