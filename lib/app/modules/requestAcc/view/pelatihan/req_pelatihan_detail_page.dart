import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/pelatihan/detail_acc_pelatihan.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class ReqPelatihanDetailPage extends StatelessWidget {
  final Pelatihan pelatihanDetail;
  ReqPelatihanDetailPage({
    super.key,
    required this.pelatihanDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Detail Penerimaan pelatihan',
      ),
      body: DetailAccPelatihan(pelatihanDetail: pelatihanDetail),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}
