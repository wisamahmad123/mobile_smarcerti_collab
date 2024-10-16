import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/pelatihan_body.dart';

class PelatihanPage extends StatelessWidget {
  const PelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Daftar Pelatihan'),
      body:  PelatihanBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 0),
    );
  }
}
