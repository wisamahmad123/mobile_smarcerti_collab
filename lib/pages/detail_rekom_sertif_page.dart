import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/detail_rekom_sertifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';


class DetailRekomSertifPage extends StatelessWidget {
  const DetailRekomSertifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Detail Sertifikasi',),
      body: DetailRekomSertifikasiBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 0),
    );
  }
}
