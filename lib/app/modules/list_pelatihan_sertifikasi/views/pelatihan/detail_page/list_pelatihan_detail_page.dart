import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/pelatihan/detail_page/list_pelatihan_detail_body.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';


class ListPelatihanDetailPage extends StatelessWidget {
  final Pelatihan pelatihanDetail; // Parameter untuk data pelatihan

  const ListPelatihanDetailPage({
    super.key,
    required this.pelatihanDetail, // Data harus diteruskan
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarCustom(title: 'Detail Pelatihan'),
      body: ListPelatihanDetailBody(pelatihanDetail: pelatihanDetail),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
