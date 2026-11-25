# Aplikasi Penggajian

Aplikasi web penggajian pegawai berbasis CodeIgniter 3.1.10 dan MariaDB/MySQL,
dijalankan dengan Docker. Ada dua peran: admin dan pegawai.

## Kebutuhan
- Docker Desktop (sudah termasuk Docker Compose)
- Git

## Menjalankan
1. Clone repo:
   ```
   git clone https://github.com/Syahfrianss/ci-penggajian-web.git
   cd penggajian
   ```
2. Jalankan:
   ```
   docker compose up -d --build
   ```
   Run pertama butuh beberapa menit (mengunduh image dan mengimpor database).
3. Cek statusnya. `db` harus `healthy`:
   ```
   docker compose ps
   ```
4. Buka:
   - Aplikasi: http://localhost:8082
   - phpMyAdmin: http://localhost:8083

## Login phpMyAdmin (khusus lokal)
| User | Password |
|---|---|
| root | root |
| penggajian | penggajian |

## Login aplikasi
Akun ada di tabel `data_pegawai`. Peran ditentukan kolom `hak_akses`
(1 = admin, 2 = pegawai).

| Username | Peran |
|---|---|
| tuti | Admin |
| doni, boy, andi, indah, sandi | Pegawai |

login menggunakan akun tuti
 Username : tuti
 Password : 123

## Perintah berguna
| Perintah | Fungsi |
|---|---|
| `docker compose logs -f web` | Lihat log Apache/PHP |
| `docker compose stop` | Matikan container |
| `docker compose down` | Hapus container, data database tetap |
| `docker compose down -v` | Hapus container dan data database (impor SQL diulang) |

## Catatan
- `database/penggajian.sql` diimpor otomatis hanya saat volume database masih kosong.
- Port 8082/8083 bisa diganti di `docker-compose.yml`. Kalau port aplikasi diganti,
  sesuaikan juga `APP_BASE_URL`.
- Project lama ini dibuat untuk PHP 7.x. Agar jalan di PHP 8.3, file
  `system/libraries/Session/Session_driver.php` diubah: nilai `NULL` pada
  `setcookie()` diganti `''` untuk menghilangkan peringatan deprecated saat logout.
- Password di `docker-compose.yml` dan password MD5 hanya untuk belajar di
  komputer sendiri. Jangan dipakai di server publik.
