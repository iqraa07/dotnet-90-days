using System.Globalization;

const decimal DiscountThreshold = 100_000m;
const decimal DiscountRate = 0.10m;
const NumberStyles PriceStyle = NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint;

Console.WriteLine("Item name:");
string? itemName = Console.ReadLine()?.Trim();
if (string.IsNullOrEmpty(itemName))
{
    Console.Error.WriteLine("Enter an item name.");
    return 1;
}

Console.WriteLine("Quantity:");
if (!int.TryParse(Console.ReadLine(), NumberStyles.Integer, CultureInfo.InvariantCulture, out int quantity)
    || quantity <= 0)
{
    Console.Error.WriteLine("Enter a positive whole-number quantity.");
    return 1;
}

Console.WriteLine("Unit price in rupiah (use . for decimals):");
string priceInput = Console.ReadLine()?.Trim() ?? string.Empty;
string[] priceParts = priceInput.Split('.', 2);
bool hasExtraPrecision = priceParts.Length == 2 && priceParts[1].TrimEnd('0').Length > 2;

if (hasExtraPrecision
    || !decimal.TryParse(priceInput, PriceStyle, CultureInfo.InvariantCulture, out decimal unitPrice)
    || unitPrice < 0m)
{
    Console.Error.WriteLine("Enter a nonnegative unit price with at most two decimal places.");
    return 1;
}

decimal subtotal;
try
{
    subtotal = quantity * unitPrice;
}
catch (OverflowException)
{
    Console.Error.WriteLine("The subtotal is too large.");
    return 1;
}

// Keep the full subtotal exactly representable in hundredths.
if (subtotal > decimal.MaxValue / 100m)
{
    Console.Error.WriteLine("The subtotal is too large.");
    return 1;
}

decimal discount = 0m;
if (subtotal > DiscountThreshold)
{
    discount = decimal.Round(subtotal * DiscountRate, 2, MidpointRounding.AwayFromZero);
}

decimal total = subtotal - discount;
CultureInfo rupiah = new("id-ID", useUserOverride: false);

Console.WriteLine();
Console.WriteLine("Receipt");
Console.WriteLine($"Item: {itemName}");
Console.WriteLine($"Quantity: {quantity}");
Console.WriteLine($"Unit price: {unitPrice.ToString("C2", rupiah)}");
Console.WriteLine($"Subtotal: {subtotal.ToString("C2", rupiah)}");
Console.WriteLine($"Discount: {discount.ToString("C2", rupiah)}");
Console.WriteLine($"Total: {total.ToString("C2", rupiah)}");

return 0;
