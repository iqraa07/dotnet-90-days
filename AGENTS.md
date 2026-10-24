# Repository working agreement

## Context

- Owner: Muhammad Iqra Nur Fajar, GitHub account `iqraa07`.
- Use one public repository for the entire program: `iqraa07/dotnet-90-days`.
- Stack: .NET 10, C# 14, ASP.NET Core, EF Core, SQL Server, xUnit, and Blazor.
- Environment: Windows and PowerShell; repository at `Documents\dotnet-90-days`.
- Use clear, concise English for documentation, explanations, identifiers, and commit messages.

## Sources of truth

Read `HANDOFF.md`, then inspect `git status`, `git log --oneline -5`, and `.\day status`. Preserve existing changes.

- `ROADMAP.md`: the 90-session plan. Keep the exact `### Day NN — Title` heading format.
- `README.md`: implementation progress. Keep the progress markers and 90-row table format.
- `days/day-NN/`: each day's overview, source links, and evidence. Unstarted days remain planned.
- `phase-1-csharp/`: daily console projects. Phase 2 and 3 use shared projects that grow over time.
- `journal/`: factual work records and the owner's separate personal reflections.
- `.agents/skills/dotnet-study/SKILL.md`: repository-specific workflow and presentation rules.

## Working modes

PAIR is the default: prepare the project and most scaffolding, leaving 1-3 core tasks marked `TODO(you)`. Each task includes a useful API hint and example input/output; the project must still build.

An explicit request to complete a day authorizes the full implementation for that day, including commit and push to this repository. It does not authorize completing the rest of the program. Day 01 has been requested in full. Future sessions return to PAIR unless requested otherwise.

MENTOR provides exercises and review without implementing the core logic. AUTO completes the implementation, explains the important lines briefly, and adds three understanding questions to the journal.

Only include personal reflections actually written or supplied by the owner under `What I understood`. Do not invent learning time, experience, understanding, or authorship claims.

## Progress and daily workflow

The main progress table records implementation and verification. Personal reflection is tracked separately in the journal; an implementation checkmark does not claim that the owner has written their reflection or mastered the material.

1. Select the active day, or the first planned day when none is active. Run `.\day new N` only when starting that day.
2. Follow the roadmap and requested working mode. Update the exercise README, daily overview, and factual journal entries.
3. Run build and run checks; run tests when a test project exists. Report actual results.
4. Use `.\day done N` after verification and personal reflection. When the owner requests implementation progress while reflection is still pending, use `.\day done N -CodeOnly`; this must still build a real project. Leave the reflection visibly pending.
5. Never use `-Force` to hide an empty reflection, missing project, or failed build.
6. Keep the daily page and catalog consistent with the main table. In PAIR/MENTOR, confirm a daily push unless the scope is already authorized.
7. Update `HANDOFF.md` last, commit meaningful work, and push within the authorized scope. End with a clean working tree.

## Code and Git

- Target `net10.0`, with Nullable and ImplicitUsings enabled. Fix warnings without suppressing them.
- Day 01 uses `UseAppHost=false` because Windows Application Control blocks its generated apphost. Use the .NET runtime and retain Windows security settings.
- Keep earlier exercises unchanged unless fixing a bug, and record any fix.
- Do not create separate daily repositories, duplicate shared phase projects, empty commits, backdated commits, or fictional progress.
- Use `main`. Commit prefixes: `day-NN:`, `fix(day-NN):`, `docs:`, or `chore:`.
- Do not force push, rewrite published history, delete journals, or commit secrets and build output.
- If the remote is ahead, pull with rebase. Explain conflicts before resolving them.
- The owner handles GitHub authentication and scope changes. Never request or expose passwords/tokens. Software installation requires permission first.
- Prefer built-in or open-source packages and explain each package's purpose before adding it.

## Documentation and evidence

- Write about the exercise, commands, actual output, and observed issues. Avoid promotional claims, decorative emoji, filler, and excessive explanation.
- Public documents focus on the work and results without naming companion services or reproducing chat history.
- Use small Mermaid diagrams when useful. Keep navigation and run instructions aligned with the repository.
- Generate progress images from actual program runs. Save the source commands and output; do not fabricate terminal output, build results, tests, or completion.
- Store evidence in `assets/progress/`, link it from the evidence index and daily page, and upload it with the day's authorized progress commit.
- Do not post to social accounts without a separate request.
- Use the available antislop and antislop-copywriting skills. Compare the installed VERSION with the [latest official release](https://github.com/miqdadbadjuber/anti-slop/releases/latest) at session start. Checking a version does not authorize updating the installation.
