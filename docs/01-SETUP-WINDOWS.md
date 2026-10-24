# 01: Setup Windows

Jalankan perintah dari PowerShell. Semua hari dan fase berada di repo `dotnet-90-days` yang sama.

## A. Periksa dan pasang perangkat

```powershell
git --version
dotnet --version
gh --version
```

`dotnet --version` harus menampilkan `10.0.x`, sesuai `global.json`. Pasang hanya paket yang belum tersedia. Instalasi memerlukan persetujuan pemilik komputer:

```powershell
winget install --id Git.Git -e
winget install --id Microsoft.DotNet.SDK.10 -e
winget install --id GitHub.cli -e
```

VS Code bersifat opsional:

```powershell
winget install --id Microsoft.VisualStudioCode -e
code --install-extension ms-dotnettools.csdevkit
```

Setelah instalasi, buka ulang PowerShell dan aplikasi yang menjalankannya agar PATH diperbarui. Jika perintah masih tidak dikenali, periksa apakah paket berhasil terpasang sebelum mengulang instalasi.

## B. Identitas Git

Cek konfigurasi yang sudah ada:

```powershell
git config --global user.name
git config --global user.email
```

Jika belum terisi, atur nama dan email sesuai persetujuan pemilik akun. Ganti placeholder email sebelum menjalankan:

```powershell
git config --global user.name "Muhammad Iqra Nur Fajar"
git config --global user.email "EMAIL-TERVERIFIKASI-ATAU-NOREPLY-GITHUB"
git config --global init.defaultBranch main
```

Gunakan email terverifikasi di akun GitHub atau alamat noreply agar commit terhubung ke akunmu. Alamat noreply tersedia di Settings → Emails. Salin alamat tepat milik akun, misalnya dalam format `ID+username@users.noreply.github.com`.

Rujukan: [pengaturan email commit](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address) dan [format alamat noreply](https://docs.github.com/en/account-and-profile/reference/email-addresses-reference).

## C. Login GitHub

```powershell
gh auth status
```

Jika akun GitHub sudah aktif, lanjut ke bagian D. Jika belum, jalankan sendiri:

```powershell
gh auth login
```

Pilih GitHub.com, HTTPS, autentikasi Git, lalu login melalui browser. Selesaikan otorisasi sendiri dan periksa kembali dengan `gh auth status`. Jangan membagikan password atau token.

### Push workflow ditolak

Jika push `.github/workflows/build.yml` ditolak dengan pesan `without workflow scope`, tambahkan izin dengan menjalankan sendiri:

```powershell
gh auth refresh -h github.com -s workflow
```

Selesaikan otorisasi melalui browser, lalu dari folder repo jalankan:

```powershell
gh auth status
.\day push
```

Gunakan repo dan remote `origin` yang sudah dibuat. Pertahankan file workflow. Rujukan: [menambah izin GitHub CLI](https://cli.github.com/manual/gh_auth_refresh).

## D. Buka folder repo

```powershell
cd "$HOME\Documents\dotnet-90-days"
.\day status
```

Sesuaikan lokasi jika folder disimpan di tempat lain. Helper `day.cmd` menjalankan skrip PowerShell dengan pengaturan eksekusi untuk proses tersebut, sehingga biasanya tidak perlu mengubah execution policy permanen.

## E. Setup GitHub awal

Bagian ini hanya untuk folder awal yang belum diinisialisasi dan belum dipublikasikan:

```powershell
.\day init
.\day publish
```

`init` membuat branch `main`, memasang workflow CI dan konfigurasi editor dari template, lalu membuat commit awal. `publish` membuat repo public `dotnet-90-days` dan melakukan push. Jika remote `origin` sudah tersedia, lanjutkan memakai repo yang sama.

Periksa hasil:

```powershell
gh repo view --json url -q .url
gh run list -L 1
.\day status
```

## F. Lanjut ke sesi belajar

Ikuti [alur kerja harian](02-WORKFLOW-HARIAN.md) dan [checklist sesi](03-PROMPTS.md). Simpan commit bermakna untuk setiap hari belajar. Isi progres, jurnal, serta petunjuk menjalankan kode berdasarkan pekerjaan dan hasil pemeriksaan yang nyata. Refleksi pribadi ditulis sendiri.
