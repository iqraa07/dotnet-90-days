# 03: Session Checklists

Choose the checklist that matches today's work. Keep all 90 days and phases in the `dotnet-90-days` repository. Record actual work and verification results; personal reflection is written by the owner.

| Session | Purpose |
|---|---|
| 0 | Initial setup |
| 1 | Start the next day |
| 2 | Review an exercise |
| 3 | Investigate an error |
| 4 | Complete a day and push |
| 5 | Resume a session |
| 6 | Weekly review |
| 7 | Update the roadmap |
| 8 | Return after a break |
| 9 | Short session |
| 10 | Full review |

## 0. Initial setup

- Check `git --version`, `dotnet --version`, and `gh --version`. The SDK must be `10.0.x`.
- Install missing tools through winget after getting the computer owner's approval. Package IDs: `Git.Git`, `Microsoft.DotNet.SDK.10`, and `GitHub.cli`.
- Reopen the terminal and its host application if commands remain unavailable after installation.
- Check `gh auth status`. If login is needed, the account owner runs `gh auth login` and completes authorization personally. Keep passwords and tokens private.
- Check `git config --global user.name` and `git config --global user.email`; confirm the identity before creating commits.
- For an initial folder without Git history or a remote, run `.\day init` followed by `.\day publish`. This creates the public `dotnet-90-days` repository.
- If a workflow push fails with `without workflow scope`, the account owner runs `gh auth refresh -h github.com -s workflow`. Once authorization is complete, check authentication status and retry `.\day push` to the existing repository.
- Check the URL with `gh repo view --json url -q .url` and the latest CI result with `gh run list -L 1`.
- Update `HANDOFF.md`, commit `chore: setup complete`, and run `.\day push`.

See [Windows setup](01-SETUP-WINDOWS.md) for installation and authentication details.

## 1. Start the next day

1. Run `git status`, `git log --oneline -5`, and `.\day status`. Read `HANDOFF.md` and the active journal.
2. Review uncommitted changes before continuing. Preserve existing work.
3. Continue the active day, or choose the first day that has not begun. Run `.\day new N` with the day number in place of `N`.
4. Read the day's goals and practice task in `ROADMAP.md`. Study the required concepts, then work through the exercise.
5. Follow the exercise README to build and run the program. Run tests if the project includes them.
6. Record goals, completed work, and issues in the journal. Keep README progress accurate.

## 2. Review an exercise

- Rerun the build, program, and available tests.
- Compare results with example input/output and the exercise README's acceptance criteria.
- Check logic, naming, error handling, and unfinished work.
- Record improvements and their reasons. Try additional inputs to check behavior.
- After trying the code, the owner writes **What I understood** in their own words.

## 3. Investigate an error

Record the following in the journal's issues section:

```text
Command:
Error message:
Expected result:
Actual result:
Steps already tried:
```

Check [troubleshooting](04-CHEATSHEET.md#troubleshooting), test one change at a time, and record the fix that worked. Remove passwords, tokens, and private information before sharing logs.

## 4. Complete a day and push

1. Confirm the implementation is complete, build and run pass, and applicable tests pass.
2. Complete the factual journal sections. Keep personal reflection separate and written only by the owner.
3. Review `git diff` and choose the completion mode: `.\day done N` requires a genuine reflection; `.\day done N -CodeOnly` is used only when the owner explicitly requests implementation progress while reflection is pending. Both modes retain build checks.
4. Run `.\day push` and check GitHub Actions.
5. Update `HANDOFF.md` with the current state, reflection status, and next steps. Commit those notes and push.
6. Run `.\day status` and `git status` to check the final state.

A progress checkmark records an implemented and verified exercise. The journal records whether personal reflection is pending. If implementation remains unfinished, keep the day in progress and save a `day-NN: wip <summary>` commit.

## 5. Resume a session

Read `HANDOFF.md`, the active journal, `git status`, `git log --oneline -10`, and `.\day status`. Continue the remaining work. Use Git history to check changes and avoid repeating completed tasks.

## 6. Weekly review

At roadmap checkpoints, review the code and journals since the previous checkpoint. Try concept questions, predict program output, and complete small coding exercises. Record personal answers, corrections, and topics to revisit in `journal/week-WW-quiz.md`.

## 7. Update the roadmap

- Identify the affected days, topics, and schedule changes before editing the plan.
- Keep the heading format `### Day NN — Title` so the helper can read it.
- Record changes in the roadmap history and preserve completed-day records.
- Run `.\day sync` and review the README table.
- Once the changes are approved, commit `docs: update roadmap (<summary>)` and push.

## 8. Return after a break

Day numbers represent study sessions. Resume unfinished work without changing earlier commit dates. If the schedule needs to be condensed, update the roadmap using checklist 7. Use `.\day skip N` only for a topic that is deliberately skipped.

## 9. Short session

Choose one task that can be checked: understand a concept, fix an error, or complete part of an exercise. Record the result and next steps. Make a WIP commit for meaningful changes if the implementation remains incomplete.

## 10. Full review

Review changes since the previous checkpoint: logic, structure, naming, error handling, security, and documentation. Record each finding with its file, line, impact, and proposed fix. Recheck the build, program, and tests after making changes.
