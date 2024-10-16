import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/detail_pelatihan_body.dart';

class DetailPelatihanPage extends StatelessWidget {
  const DetailPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Detail Pelatihan",
      ),
      body: DetailPelatihanBody(),
    );
  }
}
