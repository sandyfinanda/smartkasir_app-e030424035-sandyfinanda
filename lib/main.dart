import 'package:flutter/material.dart';
import 'pages/splash_screen_page.dart';

// Fungsi utama untuk menjalankan aplikasi.
void main() {
  runApp(const SmartKasirApp());
}

// Widget root aplikasi SmartKasir.
class SmartKasirApp extends StatelessWidget {
  const SmartKasirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartKasir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
        ),
      ),

      // Menampilkan SplashScreenPage saat aplikasi pertama kali dibuka.
      home: const SplashScreenPage(),
    );
  }
}