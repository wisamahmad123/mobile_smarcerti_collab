import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class BidangPage extends StatelessWidget {
  const BidangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidang Dosen'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Bidang Dosen'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
