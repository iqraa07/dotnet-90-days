# AGENTS.md — Instruksi untuk AI (Codex, Claude, dan agent lain)

File ini adalah **aturan utama** untuk setiap AI yang bekerja di repo ini. Codex membacanya otomatis, dan Claude membacanya lewat `CLAUDE.md`. Kalau ada aturan yang bertentangan, ikuti urutan prioritas ini: permintaan user saat itu → file ini → kebiasaan umum.

## 1. Konteks

- User: Muhammad Iqra Nur Fajar, pemilik akun GitHub `iqraa07`, sedang menjalani program belajar .NET 90 hari.
- Tujuan: program **90 hari** hingga siap kerja sebagai Junior .NET Developer, dengan **progres yang terlihat setiap hari di GitHub**.
- OS: **Windows**, shell **PowerShell**. Repo berada di `Documents\dotnet-90-days`.
- Stack: **.NET 10 (LTS)**, C# 14, ASP.NET Core, EF Core, SQL Server, xUnit, Blazor.
- Bahasa: **jelaskan dalam Bahasa Indonesia** yang santai dan jelas. **Kode, nama class/variabel, dan commit message dalam English.**
- Gaya penjelasan dan dokumentasi: singkat, profesional, langsung ke pekerjaan dan hasilnya. Hindari emoji dekoratif, kalimat promosi, dan penjelasan yang berlebihan. Simbol status pada tabel progres tetap dipakai karena dibaca helper.

## 2. File penting (sumber kebenaran)

| File | Fungsi |
|---|---|
| `ROADMAP.md` | Rencana Day 01–90. Judul hari memakai format `### Day NN — Judul` (jangan ubah formatnya). |
| `README.md` | Tabel progres 90 hari, diperbarui oleh `scripts/day.ps1`. |
| `HANDOFF.md` | Catatan serah terima antar sesi dan antar tool (Codex ↔ Claude). **Baca pertama, perbarui terakhir.** |
| `journal/day-NN-*.md` | Jurnal harian (target, yang dikerjakan, pemahaman user, kendala). |
| `scripts/day.ps1` + `day.cmd` | Helper: `new`, `done`, `skip`, `status`, `push`, `init`, `publish`. |
| `docs/03-PROMPTS.md` | Prompt siap pakai yang biasa dikirim user. |

## 3. Mode kerja

User bisa mengganti mode kapan saja dengan menulis `mode: pair`, `mode: mentor`, atau `mode: auto`. Kalau tidak disebut, pakai **PAIR**.

### PAIR (default): AI mengeksekusi, user belajar sedikit demi sedikit
1. AI menyiapkan semuanya: folder, project, package, boilerplate, wiring DI, file `.http`, dan test kerangka.
2. AI menulis sekitar 60–70% kode, lalu **meninggalkan 1–3 bagian inti** untuk user yang ditandai `// TODO(kamu): ...`. Bagian ini sesuai "TODO kamu" di ROADMAP.
3. Setiap `TODO(kamu)` wajib berisi: apa yang harus dibuat, petunjuk (nama method/API yang relevan), dan contoh input/output. **Jangan beri jawaban lengkap.**
4. Kode harus **tetap bisa di-build** walau TODO belum dikerjakan. Gunakan `throw new NotImplementedException("TODO(kamu): ...")` atau nilai sementara.
5. Jelaskan setiap konsep baru dalam **maksimal 5 poin singkat** dan sertakan contoh kecil. Tidak perlu menulis esai.
6. Setelah user bilang selesai: jalankan build, run, dan test, lalu review kodenya (apa yang sudah bagus, apa yang bisa diperbaiki, dan alasannya). Biarkan user yang memperbaikinya sendiri.
7. AI **hanya boleh** mengerjakan `TODO(kamu)` kalau user menulis "kerjakan TODO", "aku nyerah", atau "kasih jawabannya". Saat itu, jelaskan solusinya baris demi baris.

### MENTOR: user menulis hampir semua kode
AI hanya menyiapkan folder, menjelaskan, memberi soal, dan me-review. AI tidak menulis logika.

### AUTO: AI mengerjakan semuanya
AI mengerjakan semuanya termasuk TODO, tapi **tetap wajib** menjelaskan kodenya dan membuat 3 pertanyaan cek pemahaman di jurnal.

## 4. Alur kerja harian (ikuti berurutan)

1. **Cek kondisi:** `git status`, `git log --oneline -5`, baca `HANDOFF.md`, dan jalankan `.\day status`.
   - Kalau ada perubahan yang belum di-commit dari sesi atau tool lain, laporkan dulu ke user. Jangan dihapus.
2. **Tentukan hari:** pakai hari yang statusnya sedang berjalan (🟡). Kalau tidak ada, ambil hari pertama yang masih ⬜.
3. **Mulai hari:** `.\day new N`. Perintah ini membuat jurnal dan, khusus Fase 1, juga project console.
4. **Baca bagian Day N di `ROADMAP.md`**, jelaskan target hari itu, lalu kerjakan "Praktik" sesuai mode.
5. **Isi jurnal:** AI boleh mengisi "Target", "Yang dikerjakan", dan "Kendala & solusi". Bagian **"Yang saya pahami" hanya boleh ditulis oleh user**. AI boleh bertanya untuk memancing, tapi tidak boleh mengisinya.
6. **Verifikasi:** `dotnet build` (dan `dotnet test` kalau ada test) harus lulus.
7. **Selesaikan hari:** `.\day done N`. Perintah ini menandai ✅ di README dan membuat commit `day-NN: <Judul>`.
8. **Push:** `.\day push`. Dalam mode PAIR dan MENTOR, minta konfirmasi user dulu.
9. **Perbarui `HANDOFF.md`**, lalu commit (`chore: update handoff`) dan push.

Kalau sesi selesai sebelum hari itu tuntas: commit WIP (`day-NN: wip <ringkasan>`), lalu tulis di `HANDOFF.md` apa yang tersisa. **Jangan pernah meninggalkan perubahan yang belum di-commit di akhir sesi.**

## 5. Aturan Git dan GitHub

- Seluruh 90 hari memakai **satu repo**, `iqraa07/dotnet-90-days`. Simpan semua fase, jurnal, dan dokumentasi di repo ini; jangan membuat repo baru per hari atau per fase.
- Branch utama: `main`. Format commit: `day-NN: <ringkasan>`, `chore: ...`, `docs: ...`, atau `fix(day-NN): ...`.
- Minimal satu commit bermakna untuk setiap hari belajar. **Jangan membuat commit kosong atau palsu** hanya untuk membuat grafik GitHub hijau.
- Dilarang: `git push --force`, `git reset --hard` pada commit yang sudah di-push, menulis ulang riwayat, atau menghapus jurnal.
- Jangan commit `bin/`, `obj/`, `.vs/`, file `*.user`, atau secret (password, token, connection string berisi password). Gunakan `dotnet user-secrets` atau environment variable.
- **Login GitHub dilakukan sendiri oleh user** (`gh auth login`). AI tidak boleh meminta, membaca, menampilkan, atau menyimpan password maupun token. Untuk mengecek login, cukup `gh auth status`.
- Kalau `git push` ditolak karena remote lebih baru: `git pull --rebase`, lalu push lagi. Kalau ada konflik, jelaskan ke user sebelum menyelesaikannya.

## 6. Aturan kode

- Target framework `net10.0`. Nullable dan ImplicitUsings aktif. Bersihkan warning, jangan cuma disembunyikan.
- Nama dalam English dan PascalCase untuk class/method. Komentar penjelasan untuk user boleh dalam Bahasa Indonesia.
- Jangan ubah kode hari-hari sebelumnya kecuali untuk memperbaiki bug. Kalau diubah, catat di jurnal hari ini.
- Fase 2 dan 3 adalah satu solution yang berkembang terus (`phase-2-webapi/`, `phase-3-capstone/HelpdeskLite/`). Jangan membuat salinan project per hari.
- Hindari library berbayar atau berlisensi komersial (contoh: AutoMapper, MediatR, dan FluentAssertions versi baru). Pilih yang bawaan .NET atau yang benar-benar open source. Kalau ragu, tanyakan ke user dulu.
- Sebelum menambahkan package NuGet, jelaskan dulu fungsinya dalam satu kalimat.
- Jaga README utama, jurnal, dan petunjuk menjalankan project tetap sesuai kode. Tambahkan README pada project atau fase yang memerlukan langkah run, tujuan latihan, atau cara verifikasi tersendiri.
- Tulis dokumentasi dengan bahasa langsung dan detail yang benar-benar ada di repo. Jangan mengarang pengalaman kerja, hasil belajar, hasil test, atau isi refleksi user demi membuat repo terlihat lebih lengkap.

## 7. Sinkronisasi Codex ↔ Claude

- Dua tool bekerja di folder yang sama. **Jangan jalankan keduanya bersamaan pada file yang sama.**
- Sumber kebenaran: riwayat git, tabel progres di `README.md`, jurnal, dan `HANDOFF.md`. Jangan mengandalkan ingatan chat sebelumnya.
- Setiap awal sesi, jalankan langkah 1 dari alur harian. Setiap akhir sesi, langkah 9 dan pastikan working tree bersih.
- Kalau user meminta perubahan rencana ("ubah roadmap", "tambah topik", "geser jadwal"): ubah `ROADMAP.md` dengan format judul yang sama, tambahkan baris di "Riwayat Perubahan Roadmap", sesuaikan judul di tabel `README.md` kalau berubah, lalu commit `docs: update roadmap (...)`.

## 8. Khusus Codex (sandbox Windows)

- Dalam mode default (workspace-write), folder `.git` bersifat read-only dan akses network dimatikan. Karena itu, `git commit`, `git push`, `gh ...`, `dotnet new`, `dotnet add package`, dan restore NuGet bisa membutuhkan izin. **Minta izin (escalation), jangan cari jalan pintas.**
- Jalankan perintah lewat `.\day ...` atau `powershell -NoProfile -ExecutionPolicy Bypass -File scripts\day.ps1 ...`.

## 9. Definisi "hari selesai"

- [ ] Kode hari itu bisa di-build dan dijalankan, dan test-nya lulus.
- [ ] `TODO(kamu)` sudah dikerjakan user (kecuali mode AUTO atau user menyerah).
- [ ] Jurnal terisi, termasuk "Yang saya pahami" yang ditulis user sendiri.
- [ ] `.\day done N` sudah dijalankan dan sudah di-push.
- [ ] `HANDOFF.md` sudah diperbarui.

<!-- antislop:start -->
## 10. Antislop dan dokumentasi

- Gunakan skill `antislop` milik [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop) saat bekerja di repo ini. Untuk README, jurnal yang boleh diisi AI, dan panduan, baca juga `antislop-copywriting`; gunakan skill UI hanya bila tugasnya mengubah antarmuka.
- Di awal sesi, bandingkan file `VERSION` pada instalasi lokal dengan [rilis resmi terbaru](https://github.com/miqdadbadjuber/anti-slop/releases/latest). Laporkan bila ada versi baru; pengecekan versi tidak berarti mengunduh atau memasang instruksi baru secara otomatis. Jika jaringan tidak tersedia, catat bahwa versi terbaru belum terverifikasi.
- Permintaan user dan format yang dibaca helper tetap menjadi acuan. Pertahankan format judul Day di ROADMAP dan tabel progres README.
- Buang kalimat promosi generik, klaim tanpa bukti, dan penutup basa-basi. Gunakan contoh, perintah, serta hasil verifikasi yang nyata; bagian refleksi pribadi tetap ditulis user.
<!-- antislop:end -->
