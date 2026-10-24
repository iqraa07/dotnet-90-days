# Catatan sesi

**Update:** 2026-10-25
**Repo:** https://github.com/iqraa07/dotnet-90-days
**Hari aktif:** Day 01, Setup .NET 10 and Hello World

## Posisi terakhir

Kode Day 01 sudah selesai dan terverifikasi. Program menampilkan nama, waktu lokal komputer, dan versi runtime .NET. Refleksi pribadi pada jurnal belum diisi, sehingga status hari tetap sedang dikerjakan dan progres selesai masih 0/90.

Pada sesi ini pemilik meminta kode Day 01 dikerjakan penuh, dokumentasi dirapikan, folder harian dibuat, dan gambar hasil disiapkan. Permintaan itu tidak mencakup pengerjaan kode Day 02-90. Sesi berikutnya kembali ke PAIR kecuali ada permintaan lain.

## Hasil sesi

- Program console terdiri dari tiga baris, tanpa TODO atau nilai sementara.
- Build Release lulus dengan 0 warning dan 0 error. Run berhasil, exit code 0, dengan tiga baris output. SDK 10.0.402 dan runtime 10.0.13 tersedia.
- README utama memiliki peta belajar, navigasi, contoh perintah, gambar hasil, dan tabel progres yang dapat dibuka saat diperlukan.
- `days/` berisi katalog dan 90 folder harian. Day 02-90 berisi rencana materi; source tetap di folder fase agar helper tetap kompatibel.
- Panduan, jurnal, template, dan aturan penulisan dirapikan. Nama layanan pendamping tidak dicantumkan pada dokumen publik. File konfigurasi pendamping lama yang tidak lagi dipakai sudah dihapus.
- `.agents/skills/dotnet-study/SKILL.md` menyimpan konteks, lingkup kerja, gaya dokumentasi, struktur, serta aturan verifikasi dan hasil visual. Validasi skill lulus.
- `scripts/export-progress.ps1` menjalankan build/run aktual, menyimpan source dan stdout, lalu mengekspor gambar. PNG 1600 x 900 dan 1080 x 1350 sudah diperiksa secara visual.
- Aset dan sumber gambar ada di `assets/progress/`; salinan siap dibagikan disiapkan untuk pemilik. Belum ada publikasi ke media sosial.
- Bukti Day 01 sudah tersedia di GitHub. Indeks `assets/progress/README.md` menghubungkan gambar, output, data ekspor, kode terverifikasi, dan CI yang lulus. README utama memiliki navigasi serta bagian bukti progres.
- Pemilik meminta bukti ikut diunggah pada progres berikutnya. Aturan ini disimpan pada AGENTS dan skill repo; label hasil teknis tetap dibedakan dari status penyelesaian jurnal.
- Antislop lokal 3.2.20; rilis resmi terbaru yang terdeteksi adalah [3.2.23](https://github.com/miqdadbadjuber/anti-slop/releases/tag/v3.2.23). Instalasi global tidak diubah.

## Berikutnya

1. Pemilik mencoba program dan menulis catatan sendiri pada bagian `Yang saya pahami` di jurnal Day 01. Tiga pertanyaan pemahaman sudah tersedia di jurnal; jangan mengisi refleksi atas nama pemilik.
2. Setelah refleksi diberikan, salin sesuai jawaban pemilik, lakukan review singkat, lalu jalankan `.\day done 1` jika semua syarat terpenuhi. Jangan memakai `-Force` untuk melewati refleksi kosong.
3. Perbarui status halaman Day 01 dan katalog agar sesuai tabel progres, commit, dan push dalam lingkup yang diizinkan. Day 02 baru dimulai sesudah itu.

## Catatan operasional

- Seluruh 90 hari memakai satu repo dan branch utama `main`; gunakan commit harian yang bermakna.
- Identitas Git: Muhammad Iqra Nur Fajar, akun `iqraa07`, email noreply yang sudah disetujui.
- GitHub sudah login dan scope `workflow` tersedia. Jangan mengulang login atau meminta password/token.
- Terminal lama mungkin belum menerima PATH baru. Lokasi SDK pada mesin ini `C:\Program Files\dotnet`.
- Project Day 01 memakai `UseAppHost=false` karena executable apphost diblokir Windows Application Control. Jalankan melalui runtime .NET dan pertahankan kebijakan keamanan Windows.
- Pemilik meminta bahasa singkat, profesional, tanpa emoji dekoratif atau klaim berlebihan. Gambar hasil harus berasal dari eksekusi nyata, bukan status atau output yang dikarang.
