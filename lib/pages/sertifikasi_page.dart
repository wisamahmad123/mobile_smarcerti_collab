import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/sertifikasi_body.dart';

class SertifikasiPage extends StatelessWidget {
  const SertifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Daftar Sertifikasi'),
      body: SertifikasiBody(),
      bottomNavigationBar:  DosenBottomNavbar(currentIndex: 0),
    );
  }
}
