# Session handoff

**Updated:** 2026-10-25
**Repository:** https://github.com/iqraa07/dotnet-90-days
**Implementation progress:** 1/90 exercises verified
**Active exercise:** Day 02, Variables and Data Types
**Working mode:** PAIR
**Day 01 personal reflection:** pending
**Day 02 personal reflection:** pending

## Current state

Day 01 implementation remains complete. Day 02 has started in PAIR mode: the temperature converter is implemented and verified, while two data-size tasks remain for the owner. Main progress remains 1/90. Personal reflections for both days are pending; no understanding or learning time has been invented.

The owner requested full English throughout the repository and an implementation progress update. Documentation, all 90 daily pages, roadmap text, workflow guidance, templates, rules, and exported images now use English. Preserve this language preference in future sessions.

## Completed work

- Day 01 source contains three executable lines and no placeholders or remaining implementation tasks.
- Release build passed with 0 warnings and 0 errors. Run exited with code 0 and produced the expected three lines.
- The repository has one daily catalog and 90 day folders. Day 01 is implementation-complete, Day 02 is in progress, and Days 03-90 remain planned.
- The main README includes the learning map, run commands, evidence, and a collapsible progress table.
- `scripts/day.ps1` supports English journal headings and keeps legacy headings readable. Normal `done` requires a real personal reflection. Explicit `done -CodeOnly` records implementation progress with reflection pending and still requires a real project and passing build.
- Six isolated helper checks passed: empty English reflection rejection, code-only success without journal edits, filled English reflection success, legacy reflection compatibility, broken-build rejection, and missing-project rejection.
- Day 01 was recorded with `.\day done 1 -CodeOnly -NoCommit` after these checks and a passing build. The user's request authorizes this implementation-only progress update.
- `scripts/export-progress.ps1` regenerated English images from an actual program run. Both 1600 x 900 and 1080 x 1350 exports were visually checked. Source, stdout, timestamps, and exit codes are saved in `assets/progress/`.
- The evidence index and Day 01 overview link to the images, output, capture data, verified source, and CI. Shareable image copies are available for the owner; nothing has been posted to social accounts.
- `.agents/skills/dotnet-study/SKILL.md` records the English-only preference, working modes, progress semantics, evidence rules, and repository workflow.
- Day 02 now has a `net10.0` console project for Celsius-to-Fahrenheit and Celsius-to-Kelvin conversion. Input uses invariant dot decimals and rejects text, non-finite values, values below absolute zero, and overflow results.
- Day 02 Release build passed with 0 warnings and 0 errors. All 13 CLI checks passed; actual inputs, outputs, and exit codes are saved in `assets/progress/day-02-checks.txt`. Input errors currently exit cleanly with code 0.
- Two `TODO(you)` blocks remain in Day 02 `Program.cs`, at lines 34 and 38. They cover MB input validation and decimal MB-to-GB-to-TB conversion. Replace the pending message on line 42 after implementing them.
- Phase 1 now inherits `UseAppHost=false` through `phase-1-csharp/Directory.Build.props`. Earlier exercise source files were not changed.
- Day 02 evidence is currently a text transcript. The image exporter needs explicit input handling and a suitable source excerpt before use with this interactive exercise.

## Next steps

1. The owner completes the two Day 02 data-size tasks, then requests review. Do not silently fill these tasks unless the owner requests full implementation.
2. Keep both personal reflections pending until the owner supplies their own notes. Each journal includes three understanding questions for later review.
3. Record future verified implementation separately from personal reflection. Keep the main table, catalog, daily overview, journal, and evidence consistent.
4. Upload verified progress evidence to the same repository as part of the authorized day's work. Do not create another repository or publish to social accounts without a separate request.
5. Day 02 is a WIP in PAIR mode; confirm push scope before publishing unless the current conversation already authorizes it. Day 03 remains planned.

## Environment and conventions

- Owner: Muhammad Iqra Nur Fajar, account `iqraa07`; approved noreply identity is configured in Git.
- Use the existing `main` branch and meaningful commits. Authentication and the GitHub `workflow` scope are already configured.
- Target .NET 10. The local SDK is at `C:\Program Files\dotnet`; SDK 10.0.402 and runtime 10.0.13 were used for verification.
- Phase 1 uses `UseAppHost=false` because Windows Application Control blocks generated apphost executables. Retain Windows security settings and run through the .NET runtime.
- Use concise, professional English without decorative emoji, unsupported claims, or companion-service names in public documentation.
- Installed antislop version: 3.2.20. The latest checked official release is [3.2.23](https://github.com/miqdadbadjuber/anti-slop/releases/tag/v3.2.23); the global installation was not changed.
