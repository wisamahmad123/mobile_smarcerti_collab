import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class DftrPlthnSertifikasiPage extends StatelessWidget {
  const DftrPlthnSertifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pelatihan dan Sertifikasi Dosen'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Daftar Pelatihan dan Sertifikasi Dosen'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
