# Tugas 12: Implementasi Geolocator dan Geocoding di Flutter

Project Flutter ini dibuat untuk memenuhi tugas ABP (Tugas 12) mengenai integrasi fitur berbasis lokasi. Aplikasi ini memanfaatkan pustaka `geolocator` dan `geocoding` untuk menangkap data lokasi serta melakukan konversi alamat secara otomatis saat aplikasi pertama kali dimuat (_initial state_).

## 🚀 Fitur & Tugas yang Diselesaikan

Sesuai dengan instruksi tugas, aplikasi ini berhasil mengeksekusi dan menampilkan tiga fungsionalitas utama pada **Debug Console**:

1. **Instruksi 1**: Mengambil koordinat (Latitude & Longitude) perangkat saat ini menggunakan fungsi `Geolocator.getCurrentPosition()`.
2. **Instruksi 2**: Menemukan koordinat geografis dari string alamat kampus menggunakan fungsi `locationFromAddress()`.
3. **Instruksi 3**: Melakukan _reverse geocoding_ untuk menerjemahkan koordinat tertentu (`52.2165157, 6.9437819`) menjadi alamat lengkap (Nama Jalan, Kota, dan Negara) menggunakan fungsi `placemarkFromCoordinates()`.

---

## 🛠️ Pustaka yang Digunakan

Daftar dependensi yang ditambahkan pada file `pubspec.yaml`:

- `geolocator`: Untuk mengakses layanan lokasi perangkat.
- `geocoding`: Untuk fitur _geocoding_ dan _reverse geocoding_.

---

## 💻 Cara Menjalankan Project

1. **Clone Repository**
   ```bash
   git clone https://github.com/justUpi/Tugas12_Location-Services.git
   cd location_services_app
   ```
2. **Ambil Dependensi**
   ```bash
   flutter pub get
   ```
3. **Jalankan Aplikasi**
   Pastikan emulator atau perangkat fisik Anda telah mengaktifkan fitur GPS/Lokasi, lalu jalankan perintah:
   ```bash
   flutter run
   ```
4. **Periksa Output**
   Buka bagian Debug Console atau Run pada IDE Anda (VS Code / Android Studio) untuk melihat output teks dari ketiga fungsi di atas saat aplikasi pertama kali dimuat.
