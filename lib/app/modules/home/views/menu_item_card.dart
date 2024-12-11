import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_dosen.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_pimpinan.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/list_daftar_pelatihan_sertifikasi_page.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/pelatihan_dosen_page.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/request_acc_page.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/sertifikasi_dosen_page.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/sertifikasi_page.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/pelatihan_page.dart';

import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final Map<String, dynamic> data;

  MenuItemCard({super.key, required this.data});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final level = controller.userLevel.value;
    print("level menu: $level");
    return InkWell(
      onTap: () {
        // Pindah ke halaman yang sesuai ketika item di-klik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print("Selected menu: ${data['text']}");

              if (level == "2") {
                if (data['text'] == 'Pelatihan') {
                  return const PelatihanPage();
                } else if (data['text'] == 'Sertifikasi') {
                  return const SertifikasiPage();
                } else if (data['text'] ==
                    'Daftar Pelatihan dan Sertifikasi Dosen') {
                  return const ListDaftarPelatihanSertifikasiPage();
                } else if (data['text'] == 'Penerimaan Pengajuan') {
                  return const RequestPimpinan();
                } else {
                  return HomePimpinan();
                }
              } else if (level == "3") {
                if (data['text'] == 'Pelatihan') {
                  return const PelatihanDosenPage();
                } else if (data['text'] == 'Sertifikasi') {
                  return const SertifikasiDosenPage();
                } else {
                  return HomeDosen();
                }
              }
              return HomeDosen();
            },
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              data['icon'],
              size: 40.0,
              color: const Color.fromARGB(255, 28, 33, 123),
            ),
            Text(
              data['text'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 28, 33, 123),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
