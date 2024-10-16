import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/app_bar_back_button.dart';
import 'package:mobile_smarcerti/widgets/detail_pelatihan_body.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';


class DetailPelatihanPage extends StatelessWidget {
  const DetailPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarBackButton(),
      body: DetailPelatihanBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 0),
    );
  }
}
