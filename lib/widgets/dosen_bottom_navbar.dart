import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/modules/home/views/home_dosen.dart';
import '../pages/profile_dosen.dart'; // Pastikan import ini ada

class DosenBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const DosenBottomNavbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
      backgroundColor: Colors.white,
      // Untuk halaman tanpa item yang terpilih, buat warna item yang dipilih dan tidak dipilih sama
      selectedItemColor: currentIndex == -1
          ? Colors.grey
          : const Color.fromARGB(255, 239, 84, 40),
      unselectedItemColor:
          Colors.grey, // Warna yang sama untuk item yang tidak dipilih
      currentIndex: currentIndex == -1 ? 0 : currentIndex, // Set ke 0 jika -1
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 0) {
          // Navigasi ke halaman Home
          Get.offAllNamed('/homeDosen');
        }
        if (index == 1) {
          // Navigasi ke halaman Profile
          Get.offAllNamed('/profileDosen');
        }
      },
    );
  }
}
