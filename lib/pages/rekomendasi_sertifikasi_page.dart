import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class RekomendasiSertifikasiPage extends StatelessWidget {
  const RekomendasiSertifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Sertifikasi'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Rekomendasi Sertifikasi'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}

//coba