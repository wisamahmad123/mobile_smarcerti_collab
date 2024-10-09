import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class DaftarDosenPage extends StatelessWidget {
  const DaftarDosenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dosen'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Daftar Dosen'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
