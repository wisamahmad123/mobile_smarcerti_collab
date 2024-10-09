import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class DosenTidakAktifPage extends StatelessWidget {
  const DosenTidakAktifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosen Tidak Aktif'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Dosen Tidak Aktif'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
