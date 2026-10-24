# 01: Windows Setup

Run commands in PowerShell. Keep every day and phase in the same `dotnet-90-days` repository.

## A. Check and install tools

```powershell
git --version
dotnet --version
gh --version
```

`dotnet --version` must report `10.0.x`, as required by `global.json`. Install missing packages only. Get the computer owner's approval before installing software:

```powershell
winget install --id Git.Git -e
winget install --id Microsoft.DotNet.SDK.10 -e
winget install --id GitHub.cli -e
```

VS Code is optional:

```powershell
winget install --id Microsoft.VisualStudioCode -e
code --install-extension ms-dotnettools.csdevkit
```

After installation, reopen PowerShell and its host application to refresh PATH. If a command is still unavailable, check whether its package was installed successfully before repeating the installation.

## B. Git identity

Check the existing configuration:

```powershell
git config --global user.name
git config --global user.email
```

If either value is missing, confirm it with the account owner. Replace the email placeholder before running:

```powershell
git config --global user.name "Muhammad Iqra Nur Fajar"
git config --global user.email "VERIFIED-EMAIL-OR-GITHUB-NOREPLY"
git config --global init.defaultBranch main
```

Use an email verified on the GitHub account or the account's noreply address so commits are attributed correctly. Find the noreply address in Settings → Emails and copy the exact address shown, for example `ID+username@users.noreply.github.com`.

References: [commit email settings](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address) and [noreply address formats](https://docs.github.com/en/account-and-profile/reference/email-addresses-reference).

## C. GitHub authentication

```powershell
gh auth status
```

If the GitHub account is already authenticated, continue to section D. Otherwise, run this yourself:

```powershell
gh auth login
```

Choose GitHub.com, HTTPS, Git authentication, and browser login. Complete authorization yourself, then check `gh auth status` again. Keep passwords and tokens private.

### Workflow push rejected

If pushing `.github/workflows/build.yml` fails with `without workflow scope`, add the permission by running this yourself:

```powershell
gh auth refresh -h github.com -s workflow
```

Complete browser authorization, then run these commands from the repository folder:

```powershell
gh auth status
.\day push
```

Keep using the existing repository and `origin` remote. Retain the workflow file. Reference: [refreshing GitHub CLI permissions](https://cli.github.com/manual/gh_auth_refresh).

## D. Open the repository folder

```powershell
cd "$HOME\Documents\dotnet-90-days"
.\day status
```

Adjust the path if the repository is stored elsewhere. The `day.cmd` helper sets the PowerShell execution policy for its process, so a permanent policy change is usually unnecessary.

## E. Initial GitHub setup

Use this section only for an initial folder that has not been initialized or published:

```powershell
.\day init
.\day publish
```

`init` creates the `main` branch, installs the CI workflow and editor configuration from templates, and creates the initial commit. `publish` creates the public `dotnet-90-days` repository and pushes it. If `origin` already exists, continue using that repository.

Check the result:

```powershell
gh repo view --json url -q .url
gh run list -L 1
.\day status
```

## F. Continue learning

Follow the [daily workflow](02-WORKFLOW-HARIAN.md) and [session checklists](03-PROMPTS.md). Make meaningful commits for each study day. Record actual work and verification results in progress notes, journals, and run instructions. Personal reflection is written by the owner.
