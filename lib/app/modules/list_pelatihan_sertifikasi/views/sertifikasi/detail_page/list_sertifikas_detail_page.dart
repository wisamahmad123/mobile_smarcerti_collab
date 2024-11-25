import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/sertifikasi/detail_page/list_sertifikasi_detail_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class ListSertifikasDetailPage extends StatelessWidget {
  final Sertifikasi sertifikasiDetail;
  ListSertifikasDetailPage({
    super.key,
    required this.sertifikasiDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Detail Sertifikasi',
      ),
      body: ListSertifikasiDetailBody(sertifikasiDetail: sertifikasiDetail),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
