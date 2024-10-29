import 'package:flutter/material.dart';
import '../pages/home_pimpinan.dart';
import '../pages/profile_pimpinan.dart'; // Pastikan import ini ada


class PimpinanBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const PimpinanBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      backgroundColor: Colors.white,
      // Untuk halaman tanpa item yang terpilih, buat warna item yang dipilih dan tidak dipilih sama
      selectedItemColor: currentIndex == -1 ? Colors.grey : const Color.fromARGB(255, 239, 84, 40),
      unselectedItemColor: Colors.grey, // Warna yang sama untuk item yang tidak dipilih
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
