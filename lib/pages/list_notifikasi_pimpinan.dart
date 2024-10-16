import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/app_bar_back_button.dart';
import 'package:mobile_smarcerti/widgets/list_notifikasi_pimpinan_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class ListNotifikasiPimpinan extends StatelessWidget {
  const ListNotifikasiPimpinan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarBackButton(),
      body: ListNotifikasiPimpinanBody(),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
