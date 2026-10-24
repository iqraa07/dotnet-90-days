# 02: Daily Workflow

Use the `dotnet-90-days` repository for every study day. Run the helper from the repository root and keep each session's work in the appropriate source folder and journal.

## Start a session

```powershell
git status
git log --oneline -5
.\day status
```

Read `HANDOFF.md` and the active day's journal. Check uncommitted changes before adding new work.

Continue the active day. If none is active, choose the first day that has not started and pass its number to the helper. For Day 01:

```powershell
.\day new 1
```

The helper creates a journal, updates README progress, and creates a console project for Phase 1.

## Work through the exercise

1. Read the day's goals, topics, and practice task in `ROADMAP.md`.
2. Implement the exercise and complete any remaining TODO items.
3. Follow the exercise README to build and run the program.
4. Compare the output with the examples or acceptance criteria. Run tests if the project includes them.
5. Record work, issues, and verification results in the journal. The owner writes **What I understood** in their own words.

Build and run Day 01 from the repository root:

```powershell
dotnet build .\phase-1-csharp\day-01-setup-net-10-and-hello-world
dotnet run --project .\phase-1-csharp\day-01-setup-net-10-and-hello-world
```

If an error occurs, record the full message, the steps that triggered it, the expected result, and attempted fixes. Use the [session checklists](03-PROMPTS.md) to review the work.

## Record completion

A checkmark in the progress table means the exercise is implemented and verified. Track personal reflection separately in the journal.

The default `done` command checks the build and requires a genuine personal reflection:

```powershell
git diff
.\day done 1
.\day push
```

Replace `1` with the day being completed. The helper marks the day complete and creates a `day-NN: <title>` commit.

When the owner explicitly requests implementation progress while personal reflection is pending, use `-CodeOnly`:

```powershell
.\day done 1 -CodeOnly
.\day push
```

This mode still performs build checks. Run the program and any applicable tests before using it, and leave the personal reflection pending for the owner.

## Close the session

Update `HANDOFF.md` with the current state, verification results, reflection status, and next steps. Save those notes:

```powershell
git add HANDOFF.md
git commit -m "chore: update handoff"
.\day push
git status
```

If implementation is incomplete, keep the day in progress. Record the remaining work in `HANDOFF.md` and make a clear WIP commit, such as `day-01: wip add console exercise`.

## Breaks and review

Day numbers follow study sessions. After a break, continue from the last unfinished task without changing earlier commit dates. If a topic is deliberately skipped, use `.\day skip N` and record the reason.

At roadmap checkpoints, review the code, revisit difficult topics, and record the results. At the end of a phase, check the README, run instructions, journals, and tests before creating a release.
