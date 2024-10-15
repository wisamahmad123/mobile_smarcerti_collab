import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/detail_rekom_pelatihan_body.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';


class DetailRekomPelatihanPage extends StatelessWidget {
  const DetailRekomPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Detail Pelatihan'),
      body: DetailRekomPelatihanBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 0),
    );
  }
}
