# Panduan kerja repo

## Konteks

- Pemilik: Muhammad Iqra Nur Fajar, GitHub `iqraa07`.
- Seluruh program memakai satu repo public: `iqraa07/dotnet-90-days`.
- Target: 90 sesi belajar .NET 10 dan C# 14, dilanjutkan ASP.NET Core, EF Core, SQL Server, xUnit, dan Blazor.
- Lingkungan: Windows dan PowerShell. Folder kerja: `Documents\dotnet-90-days`.
- Jelaskan dalam Bahasa Indonesia yang singkat dan profesional. Gunakan English untuk identifier dan commit message.

## Sumber acuan

Baca `HANDOFF.md`, lalu periksa `git status`, `git log --oneline -5`, dan `.\day status` sebelum bekerja. Pertahankan perubahan yang sudah ada.

- `ROADMAP.md`: urutan materi. Format `### Day NN — Judul` dibaca helper; jangan diubah.
- `README.md`: tabel progres utama. Pertahankan marker progres dan struktur 90 baris tabel.
- `days/day-NN/`: pintu masuk materi dan hasil setiap hari. Folder yang belum dimulai harus jelas berstatus rencana.
- `phase-1-csharp/`: project console harian. `phase-2-webapi/` dan `phase-3-capstone/`: project bersama yang berkembang setiap hari.
- `journal/`: catatan belajar. `docs/03-PROMPTS.md`: checklist sesi.
- `.agents/skills/dotnet-study/SKILL.md`: aturan pelaksanaan dan dokumentasi untuk program ini.

## Cara bekerja

Mode default adalah PAIR: siapkan project dan mayoritas kerangka, lalu sisakan 1-3 `TODO(kamu)` sesuai ROADMAP. Setiap TODO memuat tugas, petunjuk API, dan contoh input/output; kode tetap bisa dibangun.

Jika pemilik meminta sebuah hari dikerjakan seluruhnya, selesaikan kode hari itu tanpa menyisakan TODO. Izin tersebut berlaku untuk lingkup yang diminta. Pada Day 01, pemilik sudah meminta pengerjaan penuh kode dan dokumentasi. Sesi berikutnya kembali PAIR kecuali diminta lain.

Pada mode MENTOR, siapkan latihan dan review tanpa menulis logika utama. Pada mode AUTO, kerjakan kode penuh, jelaskan bagian penting secara singkat, dan tambahkan tiga pertanyaan pemahaman pada jurnal.

Bagian `Yang saya pahami` hanya berisi catatan yang benar-benar ditulis atau disampaikan pemilik. Jangan mengarang refleksi, waktu belajar, pengalaman, atau klaim penguasaan materi. Jika belum ada catatan pribadi, selesaikan kode dan dokumentasi yang bisa dikerjakan lalu catat bahwa refleksi masih menunggu.

## Alur harian

1. Gunakan hari yang sedang berjalan; jika tidak ada, pilih hari pertama yang belum dimulai.
2. Jalankan `.\day new N`, baca materi hari itu di ROADMAP, dan kerjakan sesuai permintaan sesi.
3. Perbarui README latihan, halaman `days/day-NN/`, dan bagian jurnal yang mencatat pekerjaan nyata.
4. Jalankan build dan run; jalankan test jika project test tersedia. Laporkan hasil yang benar-benar diperoleh.
5. Jalankan `.\day done N` setelah kode, verifikasi, dan refleksi pribadi lengkap. Jangan memakai `-Force` untuk melewati refleksi kosong atau build gagal.
6. Buat commit bermakna. Pada PAIR/MENTOR, konfirmasi push harian kecuali sudah ada izin untuk lingkup itu. Permintaan pengerjaan penuh mencakup commit dan push pekerjaan yang diminta ke repo yang sama.
7. Perbarui `HANDOFF.md` terakhir, commit, dan push dalam lingkup yang diizinkan. Akhiri dengan working tree bersih. Jika hari belum tuntas, gunakan commit WIP dan catat sisa pekerjaannya.

## Kode dan Git

- Target `net10.0`; Nullable dan ImplicitUsings aktif. Selesaikan warning tanpa menyembunyikannya.
- Day 01 memakai `UseAppHost=false` karena executable apphost diblokir Windows Application Control. Jalankan melalui runtime .NET; jangan mengubah kebijakan keamanan Windows.
- Jangan mengubah latihan hari sebelumnya kecuali memperbaiki bug; catat perbaikannya.
- Jangan membuat repo baru per hari, salinan project fase 2/3, commit kosong, tanggal commit palsu, atau riwayat progres palsu.
- Branch utama `main`. Commit: `day-NN: ...`, `fix(day-NN): ...`, `docs: ...`, atau `chore: ...`.
- Jangan force push, menulis ulang riwayat yang sudah dipublikasikan, menghapus jurnal, atau commit secret dan build output.
- Jika remote lebih baru, pull dengan rebase. Jelaskan konflik sebelum menyelesaikannya.
- Login dan penambahan scope GitHub dilakukan pemilik sendiri. Jangan meminta atau menampilkan password/token. Instalasi software memerlukan izin lebih dulu.
- Pilih library bawaan atau sumber terbuka; jelaskan fungsi package sebelum menambahkannya.

## Dokumentasi dan hasil visual

- Tulis langsung tentang tujuan latihan, cara menjalankan, hasil, dan kendala yang benar-benar ada. Hindari kalimat promosi, emoji dekoratif, penutup basa-basi, serta uraian berlebihan.
- Dokumentasi publik berfokus pada materi dan hasil, tanpa menyebut nama layanan pendamping atau proses percakapan. Jangan menambahkan klaim kepengarangan yang tidak didukung pekerjaan sebenarnya.
- Gunakan diagram Mermaid sederhana bila membantu menjelaskan alur. Peta materi dan petunjuk run harus sesuai struktur repo.
- Gambar progres memakai output dari eksekusi program yang nyata. Simpan perintah dan output sumbernya; jangan mengarang hasil build, terminal, test, atau penyelesaian hari.
- Simpan aset repo di `assets/progress/`. Siapkan salinan gambar siap dibagikan bila diminta; jangan mengunggah ke akun sosial tanpa permintaan khusus.
- Gunakan skill `antislop` dan `antislop-copywriting` yang tersedia. Bandingkan VERSION lokal dengan rilis resmi [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/releases/latest) pada awal sesi. Pengecekan versi tidak mengizinkan pembaruan instalasi secara otomatis.
