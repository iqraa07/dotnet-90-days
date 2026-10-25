---
name: dotnet-study
description: Continue exercises, documentation, progress updates, and evidence in iqraa07/dotnet-90-days using its roadmap and latest session state.
---

# .NET study workflow

Read `AGENTS.md` and `HANDOFF.md` at the repository root. Use Git, the main progress table, and journals as sources of truth. Planned material is not completed work.

## Owner preferences

- Muhammad Iqra Nur Fajar, account `iqraa07`; one repository for all 90 days.
- Use concise, professional English throughout documentation, explanations, code, and commit messages.
- Public documentation covers exercises, commands, and results. Avoid companion-service names, decorative emoji, promotional language, and unsupported claims of authorship or understanding.
- PAIR is the default. A request to complete a day authorizes its implementation, not all remaining days.

## Progress and structure

- Preserve the roadmap's Day heading format, progress markers, and 90-row README table.
- Keep daily navigation in `days/day-NN/`, with source in phase folders and shared projects for phases 2/3.
- Implementation is complete when the relevant build/run checks and available tests pass. Personal reflection is separate and must come from the owner.
- Use the normal `done` command after reflection is supplied. For explicitly requested implementation progress, `done -CodeOnly` accepts a pending reflection but still requires a real build target and a passing build. Never use `-Force` to bypass verification.
- Keep pending reflection visible in the journal and daily overview. Do not invent the owner's answers.
- When implementing a day in full, add three understanding questions for later review.

## Evidence

Run the actual project before exporting a progress image. The image may arrange captured source and output for readability, but dates, values, and success states must come from that run. Save the source transcript alongside the image.

Update `assets/progress/README.md` with the image, output, and available CI link, then include it in the authorized progress push. Keep evidence labels consistent with implementation and reflection status.

For small console exercises, use `scripts/export-progress.ps1` with a day number, project path, English title/summary, and working directory. Its current layout suits short source and output such as Day 01. Inspect exported images before sharing them.

Do not publish to social accounts without a separate request.

## Known environment details

- Target .NET 10. Phase 1 inherits `UseAppHost=false` from `phase-1-csharp/Directory.Build.props` to run through the installed runtime.
- Older terminal processes may need a PATH refresh; the local SDK is at `C:\Program Files\dotnet`.
- Uploading workflow files requires the GitHub `workflow` scope. The owner completes login and scope changes themselves.

Update the handoff with verified results, relevant authorization, and the next task. End with meaningful commits and a clean working tree.
