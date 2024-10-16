import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/appbar_tabbar.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/pelatihan_body.dart';

class PelatihanPage extends StatelessWidget {
  const PelatihanPage({super.key});
  static final List<Tab> myTab = [
    const Tab(
      text: "All",
    ),
    const Tab(
      text: "Status",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: const Scaffold(
        appBar: AppBarTabBar(title: 'Daftar Pelatihan'),
        body: PelatihanBody(),
        bottomNavigationBar: DosenBottomNavbar(currentIndex: 0),
      ),
    );
  }
}
