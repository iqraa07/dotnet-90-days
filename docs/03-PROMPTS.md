# 03 — Prompt Siap Pakai (Codex & Claude)

Cara pakai: salin isi blok prompt, ganti bagian `<...>`, lalu kirim. Semua prompt mengandalkan `AGENTS.md`, jadi tidak perlu menjelaskan ulang konteksnya.

Seluruh 90 hari dan semua fase memakai satu repo **`dotnet-90-days`**. Buat commit bermakna untuk pekerjaan belajar setiap hari. Tulis progres README, jurnal, dan petunjuk menjalankan kode sesuai pekerjaan serta hasil verifikasi yang nyata; jangan mengarang hasil atau pemahaman user.

| # | Prompt | Kapan | Tool yang cocok |
|---|---|---|---|
| 0 | Setup awal | Sekali, di awal | Codex |
| 1 | Mulai hari berikutnya | Setiap hari | Codex / Claude Code |
| 2 | Review TODO saya | Setelah selesai TODO | Codex / Claude |
| 3 | Saya stuck / error | Kapan saja | Codex / Claude |
| 4 | Selesaikan hari dan push | Akhir sesi | Codex / Claude Code |
| 5 | Lanjut dari tool lain | Setiap pindah tool | Keduanya |
| 6 | Kuis mingguan | Hari checkpoint | Claude |
| 7 | Ubah roadmap | Saat rencana berubah | Claude / Codex |
| 8 | Ketinggalan beberapa hari | Setelah bolong | Keduanya |
| 9 | Mode sibuk (auto) | Hari yang padat | Codex |
| 10 | Code review mendalam | Setiap checkpoint | Claude |

---

## PROMPT 0 — Setup awal (sekali, di Codex)

```text
Kamu adalah asisten setup repo belajar .NET saya. Baca AGENTS.md, START-HERE.md, dan HANDOFF.md dulu.

Kerjakan berurutan dan laporkan hasil setiap langkah secara singkat:
1. Cek tools: `git --version`, `dotnet --version` (harus 10.0.x), `gh --version`, `gh auth status`.
   Kalau ada tool yang belum terpasang, minta izin saya sebelum menginstalnya lewat winget: `Git.Git`, `Microsoft.DotNet.SDK.10`, atau `GitHub.cli` sesuai kebutuhan.
   Kalau setelah instalasi perintah masih tidak dikenali, minta saya menutup lalu membuka ulang aplikasi Codex sebelum melanjutkan.
   Kalau GitHub belum login, BERHENTI dan minta saya menjalankan `gh auth login` sendiri.
   Jangan pernah mencoba login atas nama saya atau meminta password/token.
2. Cek `git config --global user.name` dan `git config --global user.email`. Kalau kosong, tanyakan ke saya.
3. Jalankan `.\day init` (git init branch main, ganti <GITHUB_USERNAME> di README, commit awal).
4. Jalankan `.\day publish` untuk membuat repo PUBLIC `dotnet-90-days` di akun GitHub saya dan push.
   Jika push workflow ditolak dengan pesan `without workflow scope`, berhenti dan minta saya menjalankan `gh auth refresh -h github.com -s workflow` sendiri. Setelah saya menyelesaikan otorisasi, cek `gh auth status` dan ulangi `.\day push` pada repo serta origin yang sudah dibuat. Pertahankan workflow dan jangan membuat repo baru.
5. Tampilkan URL repo (`gh repo view --json url -q .url`) dan status workflow terakhir (`gh run list -L 1`).
6. Perbarui HANDOFF.md (setup selesai, berikutnya Day 01), commit `chore: setup complete`, lalu `.\day push`.

Kalau ada perintah yang butuh izin di luar sandbox (git/gh/dotnet), minta izin ke saya. Penjelasan dalam Bahasa Indonesia.
```

---

## PROMPT 1 — Mulai hari berikutnya (setiap hari)

```text
mode: pair
Mulai sesi belajar .NET hari ini. Ikuti "Alur kerja harian" di AGENTS.md:
Kalau tool belum tersedia, minta izin sebelum instalasi lewat winget sesuai PROMPT 0. Jika setelah instalasi perintah masih tidak dikenali, minta saya menutup lalu membuka ulang Codex. Kalau GitHub belum login, berhenti dan minta saya menjalankan `gh auth login` sendiri; jangan meminta password/token.
1. Cek kondisi: `git status`, `git log --oneline -5`, baca HANDOFF.md, jalankan `.\day status`. Laporkan dalam 3 baris.
2. Tentukan hari berikutnya, lalu jalankan `.\day new N`.
3. Jelaskan target hari ini dari ROADMAP.md: maksimal 5 poin dan 1 contoh kode kecil.
4. Kerjakan bagian "Praktik", lalu siapkan 1–3 `// TODO(kamu)` sesuai "TODO kamu" di ROADMAP, berisi petunjuk dan contoh input/output, tanpa jawaban. Pastikan `dotnet build` sukses.
5. Isi bagian "Target hari ini" dan "Yang dikerjakan" di jurnal sesuai pekerjaan nyata. Jaga progres README dan petunjuk menjalankan kode tetap akurat; semua hari tetap di repo `dotnet-90-days` yang sama. Biarkan "Yang saya pahami" saya isi sendiri.
6. Terakhir, beri tahu saya: file dan baris mana yang harus saya kerjakan, perintah untuk menjalankannya, dan cara mengecek bahwa jawaban saya benar.
Waktu saya hari ini: ±<90> menit.
```

---

## PROMPT 2 — Review TODO saya

```text
Saya sudah selesai mengerjakan TODO(kamu) untuk Day <N>.
1. Jalankan build, run, dan test (kalau ada), lalu tunjukkan hasilnya.
2. Review kode saya dalam maksimal 5 poin: apa yang sudah benar dan apa yang bisa lebih baik, beserta alasannya.
   JANGAN langsung memperbaiki kode saya. Biarkan saya mencoba dulu.
3. Beri 3 pertanyaan singkat untuk mengecek pemahaman saya. Setelah saya jawab, nilai dan koreksi jawabannya.
```

---

## PROMPT 3 — Saya stuck / error

```text
Saya stuck di Day <N>.
Masalah / error lengkap:
<tempel pesan error lengkap di sini>

Yang sudah saya coba:
<...>

Jelaskan penyebabnya dengan bahasa sederhana. Beri petunjuk bertahap: Hint 1 dulu, lalu tunggu saya.
Jangan beri jawaban penuh kecuali saya menulis "aku nyerah".
```

---

## PROMPT 4 — Selesaikan hari dan push

```text
Day <N> selesai. Saya sudah mengisi "Yang saya pahami" di jurnal.
1. Lengkapi bagian jurnal yang boleh diisi AI: "Yang dikerjakan", "Kendala & solusi", dan "Rencana besok".
   Jangan ubah "Yang saya pahami".
2. Pastikan `dotnet build` (dan `dotnet test` kalau ada) lulus.
3. Jalankan `.\day done <N>`, lalu `.\day push`.
4. Perbarui HANDOFF.md (posisi, langkah berikutnya, catatan untuk AI berikutnya), commit `chore: update handoff`, lalu `.\day push`.
5. Tampilkan `.\day status` dan link commit terakhir di GitHub.
```

---

## PROMPT 5 — Lanjut dari tool lain (handoff)

```text
Saya baru pindah dari <Codex/Claude> ke kamu.
Baca AGENTS.md, HANDOFF.md, `git log --oneline -10`, `git status`, dan jurnal hari yang sedang aktif.
Ringkas posisi saya dalam 5 baris, lalu lanjutkan dari "Langkah berikutnya" di HANDOFF.md.
Jangan mengulang pekerjaan yang sudah di-commit. Kalau ada perubahan yang belum di-commit, tanyakan dulu ke saya.
```

---

## PROMPT 6 — Kuis mingguan (checkpoint)

```text
Buat review untuk minggu ke-<W> (Day <A> sampai Day <B>):
1. Rangkuman konsep, maksimal 1 halaman, dengan contoh kode singkat.
2. 10 soal: 6 pilihan ganda, 2 soal "apa output kode ini?", dan 2 soal menulis kode kecil.
   Tampilkan soal satu per satu dan tunggu jawaban saya.
3. Setelah selesai, beri nilai, jelaskan jawaban yang salah, dan sebutkan topik yang perlu saya ulang.
4. Simpan soal, jawaban saya, dan nilainya di `journal/week-<WW>-quiz.md`, lalu commit `docs: week <W> quiz`.
```

---

## PROMPT 7 — Ubah roadmap

```text
Saya mau mengubah roadmap: <contoh: tambah 2 hari khusus SQL setelah Day 39 / ganti Blazor dengan React / pindahkan Docker lebih awal>.
Tunjukkan dulu RENCANA perubahannya (hari mana yang berubah dan apa isinya), lalu tunggu persetujuan saya.
Setelah saya setuju, ikuti AGENTS.md bagian 7:
- Edit ROADMAP.md dengan format judul `### Day NN — Judul` (hanya ASCII, tanpa `|`). Total tetap 90 hari kecuali saya bilang lain.
- Jangan ubah hari yang sudah ✅.
- Tambahkan baris di "Riwayat Perubahan Roadmap".
- Jalankan `.\day sync` supaya judul di tabel README ikut ter-update.
- Commit `docs: update roadmap (<ringkasan>)`, lalu `.\day push`.
```

---

## PROMPT 8 — Ketinggalan beberapa hari

```text
Saya tidak belajar selama <X> hari. Jangan membuat commit palsu atau mengubah tanggal commit.
1. Cek posisi saya (`.\day status`, HANDOFF.md).
2. Usulkan 2 opsi: (a) lanjut normal, atau (b) gabungkan atau padatkan beberapa hari berikutnya yang topiknya ringan.
3. Kalau saya memilih (b), terapkan lewat alur PROMPT 7.
```

---

## PROMPT 9 — Mode sibuk (tetap ada progres)

```text
mode: auto
Hari ini saya hanya punya ±<30> menit. Kerjakan Day <N> secara penuh (termasuk bagian TODO), tapi:
- Jelaskan kodenya bagian per bagian dengan singkat.
- Di jurnal, tambahkan bagian "Cek pemahaman" berisi 3 pertanyaan. Saya akan menjawabnya sendiri nanti.
- Biarkan "Yang saya pahami" tetap kosong untuk saya isi. Setelah saya isi, baru jalankan PROMPT 4.
```

---

## PROMPT 10 — Code review mendalam (checkpoint)

```text
Lakukan code review untuk semua kode yang berubah sejak checkpoint terakhir (`git diff <tag-atau-commit>..HEAD` atau folder <...>).
Fokus: kebenaran logika, penamaan, struktur, error handling, keamanan, dan hal-hal yang biasa ditanyakan saat interview junior .NET.
Format jawabannya:
1. Tabel temuan (prioritas Tinggi/Sedang/Rendah, file:baris, masalah, alasan).
2. 3 hal yang sudah bagus.
3. Daftar perbaikan yang SAYA kerjakan sendiri (jangan diperbaiki langsung).
Simpan ringkasannya di jurnal hari ini pada bagian "Kendala & solusi".
```

---

## Bonus — perintah singkat (tanpa prompt panjang)

Di Codex, cukup ketik perintah-perintah ini di chat:

- `status` → AI menjalankan `.\day status` dan meringkas.
- `jelaskan lagi <konsep> dengan analogi jaringan` → penjelasan memakai analogi dari dunia kerja kamu.
- `buat 3 latihan tambahan Day <N>` → latihan ekstra tanpa jawaban.
- `mode: mentor` / `mode: pair` / `mode: auto` → ganti mode.

Non-interaktif (tanpa membuka chat), dari PowerShell:

```powershell
codex exec --sandbox read-only "Baca README.md dan HANDOFF.md lalu ringkas progres belajar saya dalam 5 baris."
```
