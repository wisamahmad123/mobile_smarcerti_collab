import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/app/modules/notifikasi/views/list_notifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class ListNotifikasi extends StatelessWidget {
  const ListNotifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: "List Notifikasi",
      ),
      body: ListNotifikasiBody(),
      bottomNavigationBar: const PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
