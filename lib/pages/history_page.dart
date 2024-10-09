import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman History'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman History'),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(),
    );
  }
}
