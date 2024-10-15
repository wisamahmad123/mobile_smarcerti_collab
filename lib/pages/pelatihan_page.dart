import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class PelatihanPage extends StatelessWidget {
  const PelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pelatihan'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman daftar pelatihan'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
