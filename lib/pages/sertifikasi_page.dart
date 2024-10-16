import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/appbar_tabbar_daftar_sertifikasi.dart';
import 'package:mobile_smarcerti/widgets/sertifikasi_body.dart';

class DaftarSertifikasiPage extends StatelessWidget {
  static final List<Tab> myTab = [
    Tab(
      text: "All",
    ),
    Tab(
      text: "Status",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppbarTabbarDaftarSertifikasi(),
        body: SertifikasiBody(),
      ),
    );
  }
}