# 04: Cheatsheet dan Troubleshooting

## Helper `day`

Jalankan helper dari root repo `dotnet-90-days`. Semua fase dan jurnal berada di repo yang sama.

| Perintah | Fungsi |
|---|---|
| `.\day status` | Menampilkan progres, hari aktif, hari berikutnya, dan commit terakhir |
| `.\day new 5` | Memulai Day 05, membuat jurnal dan project console pada Fase 1 |
| `.\day new 5 -NoProject` | Memulai hari tanpa membuat project |
| `.\day done 5` | Memeriksa build dan jurnal, menandai selesai, lalu membuat commit `day-05: ...` |
| `.\day done 5 -Message "add LINQ reports"` | Memakai ringkasan commit yang ditentukan |
| `.\day done 5 -NoCommit` | Memeriksa dan memperbarui status tanpa membuat commit |
| `.\day done 5 -Force` | Melewati pemeriksaan helper; gunakan hanya jika verifikasi telah dilakukan terpisah |
| `.\day skip 5` | Menandai topik sengaja dilewati |
| `.\day sync` | Menyamakan judul tabel README dengan roadmap |
| `.\day push` | Mengirim commit dan mengatur upstream jika diperlukan |
| `.\day init` | Menginisialisasi Git, mengisi username GitHub, dan membuat commit setup |
| `.\day publish` | Membuat repo GitHub public dan melakukan push pertama |
| `.\day publish -Private` | Membuat repo GitHub private |

Gunakan `done` setelah kode serta refleksi jurnal tuntas. Simpan pekerjaan yang belum selesai sebagai commit WIP dan pertahankan status sedang dikerjakan.

## .NET CLI

Contoh perintah dasar dengan project `MyApp`:

```powershell
dotnet --version
dotnet new console -n MyApp -f net10.0
dotnet build .\MyApp\MyApp.csproj
dotnet run --project .\MyApp\MyApp.csproj
```

Perintah berikut dijalankan dari folder project yang sesuai:

```powershell
dotnet restore
dotnet build
dotnet run
dotnet watch run
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet user-secrets init
```

Jalankan `dotnet test` dengan path project test atau solution yang memuat test. Untuk latihan harian, path serta langkah khusus tersedia pada README masing-masing latihan.

## Git dan GitHub

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

Periksa daftar perubahan sebelum `git add` dan jangan sertakan hasil build, password, token, atau connection string yang mengandung kredensial. Login GitHub dilakukan sendiri melalui `gh auth login` jika sesi belum aktif.

## Troubleshooting

| Masalah | Pemeriksaan dan solusi |
|---|---|
| `dotnet`, `gh`, atau `git` tidak dikenali | Buka ulang terminal atau aplikasi terminal setelah instalasi. Periksa `Get-Command dotnet`, `Get-Command gh`, atau `Get-Command git` dan pastikan instalasinya tersedia pada PATH. |
| SDK yang sesuai tidak ditemukan | Periksa `dotnet --list-sdks`. Repo ini memerlukan SDK 10.0.x; ikuti [panduan setup](01-SETUP-WINDOWS.md) jika belum terpasang. Instalasi perlu persetujuan pemilik komputer. |
| Script PowerShell tidak bisa dijalankan | Gunakan `.\day ...`, yang memanggil script melalui wrapper. Jika kebijakan organisasi tetap memblokirnya, ikuti ketentuan perangkat atau hubungi pengelola. |
| Restore NuGet gagal, termasuk `NU1301` | Periksa koneksi ke sumber package, proxy, dan hasil `dotnet nuget list source`, lalu ulangi `dotnet restore`. Catat sumber yang gagal serta pesan lengkapnya. |
| Commit tidak terhubung ke akun GitHub | Periksa `git config user.email`. Gunakan email terverifikasi pada akun atau alamat noreply GitHub; lihat [panduan identitas Git](01-SETUP-WINDOWS.md). |
| GitHub belum login | Jalankan `gh auth login` sendiri, lalu periksa `gh auth status`. Jangan membagikan password atau token. |
| Push workflow ditolak karena scope `workflow` | Selesaikan sendiri `gh auth refresh -h github.com -s workflow`, lalu ulangi `.\day push` pada repo yang sama. |
| Push ditolak dengan `fetch first` | Simpan pekerjaan lokal, jalankan `git pull --rebase`, selesaikan konflik jika ada, lalu ulangi `.\day push`. |
| Konflik saat rebase | Jalankan `git status`, periksa file berkonflik, pilih isi yang benar, lalu jalankan `git add <file>` dan `git rebase --continue`. |
| Port aplikasi sudah digunakan | Hentikan proses `dotnet run` yang terkait dengan Ctrl+C atau gunakan port lain pada `Properties/launchSettings.json`. |
| `bin/` atau `obj/` terlanjur terlacak | Periksa path terlebih dahulu, lalu keluarkan hanya folder build tersebut dari indeks dengan `git rm -r --cached <path>`. Pastikan pola `.gitignore` sesuai dan commit perubahannya. |
| Kredensial terlanjur di-commit | Cabut atau ganti kredensial tersebut, hapus nilainya dari kode, dan gunakan `dotnet user-secrets` atau environment variable. Menghapus file pada commit berikutnya tidak menghapus salinannya dari riwayat Git. |
