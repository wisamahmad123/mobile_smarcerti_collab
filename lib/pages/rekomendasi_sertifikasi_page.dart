import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/rekom_sertif_body.dart';

class RekomendasiSertifikasiPage extends StatelessWidget {
  const RekomendasiSertifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Daftar Rekomendasi Sertifikasi'),
      body: RekomSertifBody(),
      bottomNavigationBar:  DosenBottomNavbar(currentIndex: 0),
    );
  }
}
