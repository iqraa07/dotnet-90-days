# 04 — Cheatsheet & Troubleshooting

## Helper `day`

| Perintah | Fungsi |
|---|---|
| `.\day status` | Progres, hari aktif, hari berikutnya, 5 commit terakhir |
| `.\day new 5` | Mulai Day 05: buat jurnal, project console (khusus Fase 1), dan tandai 🟡 |
| `.\day new 5 -NoProject` | Mulai hari tanpa membuat project |
| `.\day done 5` | Cek build dan jurnal, tandai ✅, lalu commit `day-05: ...` |
| `.\day done 5 -Message "add LINQ reports"` | Sama seperti di atas, dengan pesan commit sendiri |
| `.\day done 5 -NoCommit` | Hanya menandai ✅ tanpa commit |
| `.\day done 5 -Force` | Lewati pengecekan build dan jurnal (jangan sering-sering) |
| `.\day skip 5` | Tandai ⏭️ (topik sengaja dilewati) |
| `.\day sync` | Samakan judul di tabel README dengan ROADMAP |
| `.\day push` | `git push` (otomatis set upstream) |
| `.\day init` | Sekali: git init, isi username GitHub, commit awal |
| `.\day publish` | Sekali: buat repo GitHub (public) lalu push |
| `.\day publish -Private` | Sama seperti di atas, tapi repo private |

## .NET CLI

```powershell
dotnet new console -n MyApp            # project console baru
dotnet new webapi --use-controllers -n Api
dotnet new xunit -n MyApp.Tests        # project test
dotnet new sln -n MySolution           # solution (.slnx di .NET 10)
dotnet sln add MyApp/MyApp.csproj
dotnet add MyApp.Tests reference MyApp
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet build / dotnet run / dotnet test
dotnet watch run                       # auto-reload saat file disimpan
dotnet tool install --global dotnet-ef # tool migrasi EF Core
dotnet ef migrations add InitialCreate
dotnet ef database update
dotnet user-secrets init
dotnet user-secrets set "ConnectionStrings:Default" "Server=...;"
```

## Git & GitHub

```powershell
git status                      # apa yang berubah
git log --oneline --graph -10   # riwayat singkat
git diff                        # lihat perubahan sebelum commit
git add . ; git commit -m "day-05: ..."
git push
git pull --rebase               # kalau push ditolak (remote lebih baru)
git restore <file>              # batalkan perubahan di file (belum di-commit)
git switch -c feature/x         # buat branch baru
gh pr create --fill             # buat pull request
gh run list -L 3                # status GitHub Actions
gh repo view --web              # buka repo di browser
gh release create v0.1 --generate-notes
```

## Troubleshooting

| Masalah | Solusi |
|---|---|
| `dotnet` / `gh` / `git` "not recognized" | Tutup dan buka lagi PowerShell. Kalau masih gagal, restart laptop (PATH belum ter-update). |
| `running scripts is disabled on this system` | Pakai `.\day ...` (otomatis Bypass), atau jalankan `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`. |
| `dotnet --version` bukan 10.x | `winget install --id Microsoft.DotNet.SDK.10 -e`, lalu buka PowerShell baru. `global.json` di repo ini meminta SDK 10. |
| Commit tidak muncul di kotak hijau GitHub | Email `git config user.email` harus sama dengan email di akun GitHub, dan commit harus ada di branch `main`. |
| Codex tidak bisa `git commit` / `git push` | Normal, karena `.git` dilindungi sandbox. Setujui saat Codex meminta izin. |
| Codex gagal `dotnet build` (NuGet / NU1301) | Sandbox tanpa internet. Setujui permintaan izinnya, atau aktifkan `network_access` (lihat `01-SETUP-WINDOWS.md` bagian E). |
| `! [rejected] main -> main (fetch first)` | `git pull --rebase`, lalu `git push`. |
| Konflik merge | Jangan panik. Jalankan `git status`, buka file bertanda `<<<<<<<`, pilih isi yang benar, lalu `git add` + `git rebase --continue`. Atau minta bantuan AI dengan PROMPT 3. |
| Port sudah dipakai (`address already in use`) | Matikan `dotnet run` yang lama (Ctrl+C), atau ganti port di `Properties/launchSettings.json`. |
| `bin/` atau `obj/` ikut ter-commit | `git rm -r --cached path/bin path/obj`, lalu commit. `.gitignore` sudah mengabaikannya untuk ke depan. |
| Tidak sengaja commit password / connection string | Ganti password-nya segera. Lalu hapus dari kode, simpan di `dotnet user-secrets`, dan minta bantuan AI. |
