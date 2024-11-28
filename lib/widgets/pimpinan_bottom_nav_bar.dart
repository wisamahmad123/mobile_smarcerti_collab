import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/request_acc_page.dart';
import '../app/modules/home/views/home_pimpinan.dart';
import '../app/modules/profile/views/profile_pimpinan.dart'; // Pastikan import ini ada

class PimpinanBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const PimpinanBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Request Acc'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePimpinan()),
          );
        }
        if (index == 1) {
          // Navigasi ke halaman request acc
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RequestPimpinan()),
          );
        }
        if (index == 2) {
          // Navigasi ke halaman Profile
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePimpinan()),
          );
        }
      },
    );
  }
}
