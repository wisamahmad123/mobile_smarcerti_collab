import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/sertifikasi_page.dart';

class AppbarTabbarDaftarSertifikasi extends StatelessWidget implements PreferredSizeWidget {
  const AppbarTabbarDaftarSertifikasi({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(125);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 125,
        centerTitle: true,
        backgroundColor: Color(0xFFEF5428),
        title: Text(
          "Daftar Sertifikasi",
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          tabs: DaftarSertifikasiPage.myTab,
          indicator: BoxDecoration(
              // borderRadius: BorderRadius.vertical(),
              border:
                  Border(bottom: BorderSide(color: Colors.white, width: 2))),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.only(bottom: 3),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ));
  }
}
