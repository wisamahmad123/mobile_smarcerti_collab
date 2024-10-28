import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/detail_sertifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';

class DetailSertifikasiPage extends StatelessWidget {
  const DetailSertifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Detail Sertifikasi",
      ),
      body: DetailSertifikasiBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1),
    );
  }
}
