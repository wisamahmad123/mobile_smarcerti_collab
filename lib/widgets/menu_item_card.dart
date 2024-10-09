// widgets/menu_item_card.dart
import '../pages/daftar_dosen_page.dart';
import '../pages/dosen_aktif_page.dart';
import '../pages/bidang_page.dart';
import '../pages/dosen_tidak_aktif_page.dart';
import '../pages/delegasi_dosen_page.dart';
import '../pages/home_page.dart';
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
              if (data['text'] == 'Daftar Dosen') {
                return const DaftarDosenPage();
              } else if (data['text'] == 'Dosen Aktif') {
                return const DosenAktifPage();
              } else if (data['text'] == 'Dosen Tidak Aktif') {
                return const DosenTidakAktifPage();
              } else if (data['text'] == 'Bidang') {
                return const BidangPage();
              } else if (data['text'] == 'Delegasi Dosen') {
                return const DelegasiDosenPage();
              } else {
                return const HomePage(); // Default halaman (jika tidak ada yang sesuai)
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
            Text(data['text']),
          ],
        ),
      ),
    );
  }
}

