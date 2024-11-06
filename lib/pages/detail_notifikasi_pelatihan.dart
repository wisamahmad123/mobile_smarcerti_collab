import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/detail_notifikasi_pelatihan_body.dart';

class DetailNotifikasiPelatihan extends StatelessWidget {
  const DetailNotifikasiPelatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Detail Notifikasi Pelatihan",
      ),
      body: DetailNotifikasiPelatihanBody(),
    );
  }
}
