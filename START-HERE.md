# Start Here

This is Muhammad Iqra Nur Fajar's .NET learning repository. All 90 days, source code, and journals stay in one repository: `iqraa07/dotnet-90-days`.

## 1. Check the environment

Open PowerShell in the repository folder and run:

```powershell
git --version
dotnet --version
gh --version
```

The repository uses .NET SDK `10.0.x`. Install missing tools only, with the computer owner's approval:

```powershell
winget install --id Git.Git -e
winget install --id Microsoft.DotNet.SDK.10 -e
winget install --id GitHub.cli -e
```

After installation, reopen the terminal and its host application to refresh PATH. See the [Windows setup guide](docs/01-SETUP-WINDOWS.md) for details.

## 2. Check identity and authentication

```powershell
git config --global user.name
git config --global user.email
gh auth status
```

The repository owner is Muhammad Iqra Nur Fajar. Use an email verified on the GitHub account or the account's noreply address from Settings → Emails. See [GitHub's commit email instructions](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address).

If the account is already authenticated, continue to the next step. Otherwise, run `gh auth login` yourself and complete browser authorization. Keep passwords and tokens private.

## 3. Set up the repository once

Check the repository before running setup:

```powershell
git status
git remote -v
```

For an initial folder that has neither Git history nor a GitHub repository:

```powershell
.\day init
.\day publish
```

The publish command creates the public `dotnet-90-days` repository. Once the repository and `origin` remote exist, use `.\day push` for subsequent changes. Keep every phase in the same repository.

## 4. Start learning

```powershell
.\day status
```

Continue the active day, or start the first day that has not begun. For Day 01:

```powershell
.\day new 1
```

Read the goals in the [roadmap](ROADMAP.md), follow the exercise README, and record verified results in the journal. Write personal reflections in your own words.

A progress checkmark records an implemented and verified exercise. Personal reflection is tracked separately in the journal. The default `done` command requires that reflection; `-CodeOnly` is available when the owner explicitly requests implementation progress while reflection is pending. See the [daily workflow](docs/02-WORKFLOW-HARIAN.md).

| Document | Purpose |
|---|---|
| [Roadmap](ROADMAP.md) | Goals and exercises for Day 01 through Day 90 |
| [Daily workflow](docs/02-WORKFLOW-HARIAN.md) | Learning, verification, commits, and pushes |
| [Session checklists](docs/03-PROMPTS.md) | Setup, review, and session completion |
| [Cheatsheet](docs/04-CHEATSHEET.md) | Common commands and troubleshooting |
| [Journals](journal/) | Daily work, issues, and personal reflection |

Make meaningful commits for each study day. Keep README progress, journals, and run instructions consistent with verified results.
