import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 12 Location Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocationTaskScreen(),
    );
  }
}

class LocationTaskScreen extends StatefulWidget {
  const LocationTaskScreen({super.key});

  @override
  State<LocationTaskScreen> createState() => _LocationTaskScreenState();
}

class _LocationTaskScreenState extends State<LocationTaskScreen> {
  @override
  void initState() {
    super.initState();
    // Menjalankan fungsi saat aplikasi pertama kali dimuat
    jalankanTugasNavigasi();
  }

  Future<void> jalankanTugasNavigasi() async {
    print('=== TUGAS 12 - Location Services ===');
    
    // Handle izin lokasi terlebih dahulu
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Layanan lokasi dinonaktifkan.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Izin lokasi ditolak.');
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      print('Izin lokasi ditolak secara permanen.');
      return;
    }

    
    // INSTRUKSI 1: Ambil koordinat saat ini menggunakan Geolocator
    
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high)
      );
      print('👉 [INSTRUKSI 1] Koordinat Perangkat Saat Ini:');
      print('   Latitude : ${position.latitude}');
      print('   Longitude: ${position.longitude}');
    } catch (e) {
      print('Gagal mengambil lokasi saat ini: $e');
    }

    print('--------------------------------------------------');

    
    // INSTRUKSI 2: Cari koordinat dari alamat kampus menggunakan geocoding
    
    try {
      // Silakan ubah string alamat di bawah ini sesuai nama kampus Anda jika diperlukan
      String alamatKampus = "Universitas Indonesia, Depok"; 
      List<Location> locations = await locationFromAddress(alamatKampus);
      
      if (locations.isNotEmpty) {
        print('👉 [INSTRUKSI 2] Koordinat dari Alamat Kampus ($alamatKampus):');
        print('   Latitude : ${locations.first.latitude}');
        print('   Longitude: ${locations.first.longitude}');
      }
    } catch (e) {
      print('Gagal melakukan geocoding alamat kampus: $e');
    }

    print('--------------------------------------------------');

    
    // INSTRUKSI 3: Reverse geocoding koordinat 52.2165157, 6.9437819
    
    try {
      double targetLat = 52.2165157;
      double targetLng = 6.9437819;
      
      List<Placemark> placemarks = await placemarkFromCoordinates(targetLat, targetLng);
      
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        print('👉 [INSTRUKSI 3] Hasil Konversi Koordinat ($targetLat, $targetLng):');
        print('   Nama Jalan : ${place.street}');
        print('   Kota        : ${place.locality ?? place.subAdministrativeArea}');
        print('   Negara      : ${place.country}');
      }
    } catch (e) {
      print('Gagal melakukan reverse geocoding koordinat target: $e');
    }

    print('=== SELESAI EKSEKUSI TUGAS 12 ===');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 12: Geolocator & Geocoding'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          // Indikator sederhana di layar handphone/emulator
          child: Text(
            'Proses sedang berjalan. Silakan periksa bagian Debug Console / Run tab di IDE Anda untuk melihat output teks.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}