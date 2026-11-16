string[] menu = ["1 add", "2 view", "3 delete", "0 exit"];
var devices = new List<string>();

while (true)
{
    Console.WriteLine(string.Join(" | ", menu));
    switch (Console.ReadLine()?.Trim())
    {
        case "1":
            Console.WriteLine("Device name:");
            string? name = Console.ReadLine()?.Trim();
            if (name is null)
            {
                return;
            }
            if (name.Length == 0)
            {
                Console.WriteLine("Enter a device name.");
                break;
            }
            devices.Add(name);
            Console.WriteLine($"Added: {name}");
            break;

        case "2":
            if (devices.Count == 0)
            {
                Console.WriteLine("No devices.");
            }
            for (int index = 0; index < devices.Count; index++)
            {
                Console.WriteLine($"{index + 1}. {devices[index]}");
            }
            break;

        case "3":
            Console.WriteLine("Device number:");
            string? numberInput = Console.ReadLine();
            if (numberInput is null)
            {
                return;
            }
            if (!int.TryParse(numberInput, out int number) || number < 1 || number > devices.Count)
            {
                Console.WriteLine("Unknown device number.");
                break;
            }
            string removed = devices[number - 1];
            devices.RemoveAt(number - 1);
            Console.WriteLine($"Removed: {removed}");
            break;

        case "0":
        case null:
            return;

        default:
            Console.WriteLine("Unknown menu choice.");
            break;
    }
}
