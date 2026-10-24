# 03: Checklist Sesi Belajar

Gunakan checklist yang sesuai dengan pekerjaan hari ini. Seluruh 90 hari dan semua fase tetap berada di repo `dotnet-90-days`. Catat pekerjaan dan hasil pemeriksaan yang nyata; refleksi ditulis dengan kata-kata sendiri.

| Sesi | Tujuan |
|---|---|
| 0 | Setup awal |
| 1 | Mulai hari berikutnya |
| 2 | Review latihan |
| 3 | Menangani error |
| 4 | Selesaikan hari dan push |
| 5 | Lanjutkan sesi |
| 6 | Evaluasi mingguan |
| 7 | Ubah roadmap |
| 8 | Lanjut setelah jeda |
| 9 | Sesi singkat |
| 10 | Review menyeluruh |

## 0. Setup awal

- Periksa `git --version`, `dotnet --version`, dan `gh --version`. SDK harus `10.0.x`.
- Pasang perangkat yang belum tersedia melalui winget setelah mendapat persetujuan pemilik komputer. ID paket: `Git.Git`, `Microsoft.DotNet.SDK.10`, dan `GitHub.cli`.
- Buka ulang terminal dan aplikasi yang menjalankannya bila perintah belum dikenali setelah instalasi.
- Periksa `gh auth status`. Jika belum login, pemilik akun menjalankan `gh auth login` dan menyelesaikan otorisasi sendiri. Jangan membagikan password atau token.
- Periksa `git config --global user.name` dan `git config --global user.email`; tentukan identitas sebelum membuat commit.
- Untuk folder awal yang belum memiliki Git dan remote, jalankan `.\day init`, lalu `.\day publish`. Repo dibuat public dengan nama `dotnet-90-days`.
- Jika push workflow ditolak karena `without workflow scope`, pemilik akun menjalankan `gh auth refresh -h github.com -s workflow` sendiri. Setelah otorisasi selesai, periksa status dan ulangi `.\day push` ke repo yang sudah dibuat.
- Periksa URL dengan `gh repo view --json url -q .url` dan hasil CI dengan `gh run list -L 1`.
- Perbarui `HANDOFF.md`, commit `chore: setup complete`, lalu jalankan `.\day push`.

Detail instalasi dan autentikasi ada di [setup Windows](01-SETUP-WINDOWS.md).

## 1. Mulai hari berikutnya

1. Jalankan `git status`, `git log --oneline -5`, dan `.\day status`. Baca `HANDOFF.md` serta jurnal yang aktif.
2. Periksa perubahan yang belum di-commit sebelum melanjutkan. Pertahankan pekerjaan yang sudah ada.
3. Lanjutkan hari aktif, atau ambil hari pertama yang belum dimulai. Gunakan `.\day new N`, dengan `N` diganti nomor hari.
4. Baca target dan praktik hari itu di `ROADMAP.md`. Pelajari konsep yang diperlukan, lalu kerjakan latihan.
5. Jalankan build dan run sesuai README latihan. Jalankan test jika project sudah memiliki test.
6. Isi target, pekerjaan yang sudah dilakukan, dan kendala pada jurnal. Jaga progres README sesuai status sebenarnya.

## 2. Review latihan

- Jalankan ulang build, program, dan test yang tersedia.
- Bandingkan hasil dengan contoh input/output dan kriteria di README latihan.
- Periksa logika, penamaan, penanganan error, dan bagian yang masih belum selesai.
- Catat perbaikan beserta alasannya. Coba masukan lain untuk memeriksa perilaku program.
- Tulis bagian **Yang saya pahami** dengan kata-kata sendiri setelah mencoba kode.

## 3. Menangani error

Catat informasi berikut di bagian kendala pada jurnal:

```text
Perintah yang dijalankan:
Pesan error:
Hasil yang diharapkan:
Hasil yang terjadi:
Langkah yang sudah dicoba:
```

Periksa [troubleshooting](04-CHEATSHEET.md#troubleshooting), uji satu perubahan setiap kali, lalu catat solusi yang berhasil. Hapus password, token, atau data pribadi sebelum menyalin log.

## 4. Selesaikan hari dan push

1. Pastikan latihan selesai, build dan run lulus, serta test lulus jika tersedia.
2. Lengkapi jurnal, termasuk refleksi **Yang saya pahami** yang ditulis sendiri.
3. Periksa perubahan dengan `git diff`, lalu jalankan `.\day done N` untuk menandai hari selesai dan membuat commit.
4. Jalankan `.\day push`, lalu periksa hasil GitHub Actions.
5. Perbarui `HANDOFF.md` dengan posisi terakhir dan langkah selanjutnya. Commit perubahan tersebut dan push.
6. Jalankan `.\day status` dan `git status` untuk memeriksa hasil akhir.

Jika pekerjaan belum tuntas, pertahankan status sedang dikerjakan dan simpan commit `day-NN: wip <ringkasan>`. Jangan menandai hari selesai hanya karena sesi berakhir.

## 5. Lanjutkan sesi

Baca `HANDOFF.md`, jurnal aktif, `git status`, `git log --oneline -10`, dan `.\day status`. Lanjutkan dari pekerjaan yang tersisa. Gunakan riwayat Git untuk memeriksa perubahan; hindari mengulang pekerjaan yang sudah selesai.

## 6. Evaluasi mingguan

Pada checkpoint di roadmap, tinjau kode dan jurnal sejak checkpoint sebelumnya. Coba soal konsep, prediksi output, serta latihan kode kecil. Catat jawaban sendiri, koreksi yang diperlukan, dan topik yang perlu diulang di `journal/week-WW-quiz.md`.

## 7. Ubah roadmap

- Tentukan hari, topik, dan dampak jadwal sebelum mengubah rencana.
- Pertahankan judul dengan format `### Day NN — Judul` agar helper tetap dapat membacanya.
- Catat perubahan dalam riwayat roadmap dan pertahankan catatan hari yang sudah selesai.
- Jalankan `.\day sync`, lalu periksa kembali tabel README.
- Buat commit `docs: update roadmap (<ringkasan>)` dan push setelah perubahan disetujui.

## 8. Lanjut setelah jeda

Nomor hari menunjukkan sesi belajar. Lanjutkan hari yang belum tuntas tanpa mengubah tanggal commit sebelumnya. Jika jadwal perlu dipadatkan, sesuaikan roadmap melalui checklist 7. Gunakan `.\day skip N` hanya untuk topik yang memang sengaja dilewati.

## 9. Sesi singkat

Pilih satu pekerjaan yang dapat diperiksa: memahami satu konsep, memperbaiki satu error, atau melengkapi bagian latihan. Catat hasil dan langkah berikutnya. Simpan commit WIP untuk perubahan yang bermakna jika hari belum selesai.

## 10. Review menyeluruh

Periksa perubahan sejak checkpoint sebelumnya: kebenaran logika, struktur, penamaan, penanganan error, keamanan, dan dokumentasi. Catat temuan dengan file, baris, dampak, dan usulan perbaikan. Periksa ulang build, run, serta test setelah perbaikan.
