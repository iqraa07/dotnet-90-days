# Day 23: Generics

The in-memory repository stores records by ID and supports adding, lookup, listing, removal, and predicate-based filtering. The example uses the same repository with assets and tickets.

## Run from the repository root

```powershell
dotnet run --project .\phase-1-csharp\day-23-generics -c Release
```

The location predicate finds `Laptop, Switch`. After removing asset 2, lookup reports it as missing. The ticket repository still lists `Printer jam`.

## Implementation

`InMemoryRepository<T>` requires a reference type that implements `IEntity`. Its `Dictionary<int, T>` keeps records by ID. `Add` rejects duplicate IDs, `GetById` returns `null` for a missing record, and `Remove` says whether a record was found and deleted.

`Find(Func<T, bool>)` uses a caller-supplied test, such as `asset => asset.Location == "Makassar"`. `GetAll` and `Find` materialize arrays sorted by ID so later repository changes leave earlier results intact. The generic `PrintNames<T>` method prints names for both record types.

[Daily overview and run evidence](../../days/day-23/README.md) · [Learning journal](../../journal/day-23-generics.md)
