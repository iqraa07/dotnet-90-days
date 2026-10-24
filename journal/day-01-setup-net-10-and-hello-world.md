# Day 01: Setup .NET 10 and Hello World

- **Started:** 2026-10-24
- **Updated:** 2026-10-25
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-01-setup-net-10-and-hello-world)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Learn the role of the SDK and runtime, `Program.cs`, the `.csproj` file, and the `dotnet new`, `dotnet build`, and `dotnet run` commands. Print three lines: a name, local time, and the runtime version.

## Work completed

- [x] Installed .NET SDK 10.0.402, configured Git identity, and connected `iqraa07/dotnet-90-days`.
- [x] Created a `net10.0` console project with Nullable and ImplicitUsings enabled.
- [x] Replaced all placeholders with the owner's name, `DateTime.Now`, and `Environment.Version`.
- [x] Built the Release configuration with 0 warnings and 0 errors.
- [x] Ran the application with exit code 0 and the expected three output lines.
- [x] Added the exercise README and Day 01-90 catalog; later days remain planned.
- [x] Exported 1600 x 900 and 1080 x 1350 images from actual source and execution output.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write your own notes after running the program. -->
-

## Study notes

`Console.WriteLine` writes one line to the terminal. `DateTime.Now` reads the computer's local time when the program runs. `Environment.Version` identifies the runtime running the application; this differs from the SDK used to build the project.

## Understanding check

1. What does `Console.WriteLine` do in this program?
2. Why can the date line change when the program runs again?
3. Why do `dotnet --version` and `Environment.Version` show different versions?

## Issues and solutions

| Issue | Cause | Resolution |
|---|---|---|
| `dotnet` was unavailable after installation | The existing terminal had an older PATH | Loaded the SDK location for the working process; reopen the terminal for later sessions |
| The first workflow upload was rejected | The GitHub session lacked the `workflow` scope | Completed account authorization, checked the scope, and retried the push |
| The generated apphost was blocked | Windows Application Control rejected the executable | Set `UseAppHost=false` and ran the application through the .NET runtime |

## Next steps

Implementation progress is recorded separately from reflection. Add personal notes when ready. The next planned exercise is Day 02: Variables and Data Types.
