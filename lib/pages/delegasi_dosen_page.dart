import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class DelegasiDosenPage extends StatelessWidget {
  const DelegasiDosenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delegasi Dosen'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Delegasi Dosen'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
