# Day 01: Setup .NET 10 and Hello World

**Implementation:** complete and verified.

**Personal reflection:** pending in the journal.

## Focus

The .NET platform, SDK versus runtime, `dotnet new`, `dotnet build`, and `dotnet run`; the roles of `.csproj` and `Program.cs`; top-level statements.

## Exercise

A console application prints a name, the computer's local date and time, and the active .NET runtime version.

- [Source and run instructions](../../phase-1-csharp/day-01-setup-net-10-and-hello-world/README.md)
- [Day 01 journal](../../journal/day-01-setup-net-10-and-hello-world.md)

## Execution results

[Progress evidence and CI results](../../assets/progress/README.md#day-01-hello-world)

![Day 01 source and program output](../../assets/progress/day-01-terminal.png)

The Release build passed with 0 warnings and 0 errors. The application printed the three expected lines and exited with code 0.

- [Social image, 1080 x 1350](../../assets/progress/day-01-social.png)
- [Commands and output](../../assets/progress/day-01-output.txt)
- [Export source data](../../assets/progress/day-01-capture.json)

The image presents source code and output from an actual run. To recreate it from the repository root:

```powershell
.\scripts\export-progress.ps1 -Day 1 -Project 'phase-1-csharp\day-01-setup-net-10-and-hello-world' -Title 'Hello World' -WorkDirectory (Join-Path $env:TEMP 'dotnet-day-01-export')
```

[Full outline](../../ROADMAP.md#day-01--setup-net-10-and-hello-world) · [Daily progress](../../README.md#daily-progress) · [Day catalog](../README.md)
