import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/app_bar_back_button.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/list_notifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class ListNotifikasi extends StatelessWidget {
  const ListNotifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
        title: "List Notifikasi",
      ),
      body: ListNotifikasiBody(),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
