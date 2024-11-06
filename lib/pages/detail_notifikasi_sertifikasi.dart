import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/detail_notifikasi_sertifikasi_body.dart';

class DetailNotifikasiSertifikasi extends StatelessWidget {
  const DetailNotifikasiSertifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Detail Notifikasi Sertifikasi",
      ),
      body: DetailNotifikasiSertifikasiBody(),
    );
  }
}
