# 04: Cheatsheet and Troubleshooting

## The `day` helper

Run the helper from the `dotnet-90-days` repository root. Keep every phase and journal in the same repository.

| Command | Purpose |
|---|---|
| `.\day status` | Show progress, the active day, the next day, and recent commits |
| `.\day new 5` | Start Day 05 and create a journal and a Phase 1 console project |
| `.\day new 5 -NoProject` | Start a day without creating a project |
| `.\day done 5` | Check the build and personal reflection, mark complete, and create a `day-05: ...` commit |
| `.\day done 5 -CodeOnly` | Check the build and mark implementation complete when explicitly requested by the owner; personal reflection may remain pending |
| `.\day done 5 -Message "add LINQ reports"` | Use a custom commit summary |
| `.\day done 5 -NoCommit` | Check and update progress without creating a commit |
| `.\day skip 5` | Mark a deliberately skipped topic |
| `.\day sync` | Match README table titles to the roadmap |
| `.\day push` | Push commits and configure upstream if needed |
| `.\day init` | Initialize Git, fill in the GitHub username, and create a setup commit |
| `.\day publish` | Create a public GitHub repository and push |
| `.\day publish -Private` | Create a private GitHub repository |

A progress checkmark records an implemented and verified exercise. Track personal reflection separately in the journal. The default `done` command requires that reflection; use `-CodeOnly` only for an explicit owner request. Save incomplete implementation as a WIP commit and keep the day in progress.

## .NET CLI

Basic commands using a project named `MyApp`:

```powershell
dotnet --version
dotnet new console -n MyApp -f net10.0
dotnet build .\MyApp\MyApp.csproj
dotnet run --project .\MyApp\MyApp.csproj
```

Run the following commands from the appropriate project folder:

```powershell
dotnet restore
dotnet build
dotnet run
dotnet watch run
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet user-secrets init
```

Run `dotnet test` with a test project path or a solution containing tests. Each exercise README provides its paths and any additional steps.

## Git and GitHub

```powershell
git status
git log --oneline --graph -10
git diff
git add .
git commit -m "day-05: add loop exercise"
.\day push
gh auth status
gh run list -L 3
gh repo view --web
```

Review changes before `git add`. Keep build output, passwords, tokens, and connection strings containing credentials out of commits. If the GitHub session is inactive, the account owner runs `gh auth login` personally.

## Troubleshooting

| Problem | Checks and solution |
|---|---|
| `dotnet`, `gh`, or `git` is not recognized | Reopen the terminal and its host application after installation. Check `Get-Command dotnet`, `Get-Command gh`, or `Get-Command git` and confirm the installation is on PATH. |
| Required SDK is unavailable | Check `dotnet --list-sdks`. This repository requires SDK 10.0.x; follow the [setup guide](01-SETUP-WINDOWS.md) if it is missing. Installation requires the computer owner's approval. |
| PowerShell script cannot run | Use `.\day ...` to invoke the wrapper. If an organization policy still blocks execution, follow the device policy or contact its administrator. |
| NuGet restore fails, including `NU1301` | Check connectivity to package sources, proxy settings, and `dotnet nuget list source`, then retry `dotnet restore`. Record the failing source and full error. |
| Commits are not attributed to the GitHub account | Check `git config user.email`. Use an email verified on the account or its GitHub noreply address; see the [Git identity guide](01-SETUP-WINDOWS.md). |
| GitHub is not authenticated | Run `gh auth login` yourself, then check `gh auth status`. Keep passwords and tokens private. |
| Workflow push rejected because of the `workflow` scope | Complete `gh auth refresh -h github.com -s workflow` yourself, then retry `.\day push` to the same repository. |
| Push rejected with `fetch first` | Save local work, run `git pull --rebase`, resolve any conflicts, and retry `.\day push`. |
| Rebase conflict | Run `git status`, review conflicting files, choose the correct content, then run `git add <file>` and `git rebase --continue`. |
| Application port is in use | Stop the relevant `dotnet run` process with Ctrl+C or choose another port in `Properties/launchSettings.json`. |
| `bin/` or `obj/` is already tracked | Check the path first, then remove only those build folders from the index with `git rm -r --cached <path>`. Confirm `.gitignore` patterns and commit the change. |
| Credentials were committed | Revoke or rotate them, remove their values from the code, and use `dotnet user-secrets` or environment variables. Removing a file in a later commit leaves earlier copies in Git history. |
