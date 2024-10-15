import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class SertifikasiPage extends StatelessWidget {
  const SertifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sertifikasi'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Sertifikasi'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
