import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/app_bar_back_button.dart';
import 'package:mobile_smarcerti/widgets/detail_notifikasi_pimpinan_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class DetailNotifikasiPimpinan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton(),
      body: DetailNotifikasiPimpinanBody(),
      bottomNavigationBar: PimpinanBottomNavBar(),
    );
  }
}
