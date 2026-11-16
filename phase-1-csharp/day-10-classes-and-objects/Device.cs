public sealed class Device
{
    public Device(string name, string ipAddress, string location, DateOnly purchaseDate)
    {
        Name = name;
        IpAddress = ipAddress;
        Location = location;
        PurchaseDate = purchaseDate;
    }

    public string Name { get; }
    public string IpAddress { get; }
    public string Location { get; }
    public DateOnly PurchaseDate { get; }

    public int GetAgeInYears() => GetAgeInYears(DateOnly.FromDateTime(DateTime.Today));

    public int GetAgeInYears(DateOnly asOf)
    {
        if (asOf < PurchaseDate)
        {
            throw new ArgumentOutOfRangeException(nameof(asOf), "The report date precedes the purchase.");
        }

        int years = asOf.Year - PurchaseDate.Year;
        return asOf < PurchaseDate.AddYears(years) ? years - 1 : years;
    }

    public override string ToString() => $"{Name} ({IpAddress}) in {Location}";
}
