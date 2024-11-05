import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/list_pelatihan_detail_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';


class ListPelatihanDetailPage extends StatelessWidget {
  const ListPelatihanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Detail Pelatihan'),
      body: ListPelatihanDetailBody(),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
