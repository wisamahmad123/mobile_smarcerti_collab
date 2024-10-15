import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class RekomendasiPelatihanPage extends StatelessWidget {
  const RekomendasiPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Pelatihan'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Rekomendasi Pelatihan'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
