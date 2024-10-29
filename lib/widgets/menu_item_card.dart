// widgets/menu_item_card.dart
import 'package:mobile_smarcerti/pages/sertifikasi_page.dart';

import '../pages/pelatihan_page.dart';
import '../pages/rekomendasi_sertifikasi_page.dart';
import '../pages/rekomendasi_pelatihan_page.dart';
import '../pages/dftr_plthn_sertifikasi_page.dart';
import '../pages/home_pimpinan.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const MenuItemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Pindah ke halaman yang sesuai ketika item di-klik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // Buat halaman baru berdasarkan teks yang di-klik
              if (data['text'] == 'Pelatihan') {
                return const PelatihanPage();
              } else if (data['text'] == 'Sertifikasi') {
                return DaftarSertifikasiPage();
              } else if (data['text'] == 'Rekomendasi Pelatihan') {
                return const RekomendasiPelatihanPage();
              } else if (data['text'] == 'Rekomendasi Sertifikasi') {
                return const RekomendasiSertifikasiPage();
              } else if (data['text'] == 'Daftar Pelatihan dan Sertifikasi Dosen') {
                return const DftrPlthnSertifikasiPage();
              } else {
                return const HomePimpinan(); // Default halaman (jika tidak ada yang sesuai)
              }
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

