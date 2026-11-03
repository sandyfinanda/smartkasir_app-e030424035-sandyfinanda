import 'dart:async';
import 'package:flutter/material.dart';
import 'main_navigation_page.dart';

// Halaman pembuka aplikasi SmartKasir.
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // Durasi hitung mundur dalam detik.
  int _durasiDetik = 5;

  // Timer untuk mengatur perpindahan halaman.
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _mulaiHitungMundur();
  }

  // Menjalankan hitung mundur dan navigasi otomatis.
  void _mulaiHitungMundur() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_durasiDetik > 1) {
          setState(() {
            _durasiDetik--;
          });
        } else {
          _timer?.cancel();

          // Memastikan widget masih aktif sebelum navigasi.
          if (!mounted) return;

          // Mengganti splash screen dengan halaman navigasi utama.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainNavigationPage(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // Menghentikan timer saat widget dihancurkan.
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi.
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.point_of_sale_rounded,
                size: 72,
                color: Color(0xFF1E3A8A),
              ),
            ),

            const SizedBox(height: 24),

            // Nama aplikasi.
            const Text(
              'SmartKasir',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 6),

            // Tagline aplikasi.
            const Text(
              'Aplikasi Kasir Point of Sale Digital',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 36),

            // Indikator loading.
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 3,
              ),
            ),

            const SizedBox(height: 14),

            // Teks hitung mundur.
            Text(
              'Memuat data toko ($_durasiDetik detik)...',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 40),

            // Informasi versi aplikasi.
            Text(
              'Versi 1.0.0 — Modul Pertemuan 10',
              style: TextStyle(
                fontSize: 11,
                color: Colors.blue.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}