import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/rekom_pelatihan_body.dart';

class RekomendasiPelatihanPage extends StatelessWidget {
  const RekomendasiPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Daftar Rekomendasi Pelatihan'),
      body:  RekomPelatihanBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 0),
    );
  }
}
