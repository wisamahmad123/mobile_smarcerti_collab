import 'package:flutter/material.dart';
import '../pages/home_dosen.dart';
import '../pages/profile_dosen.dart'; // Pastikan import ini ada
import '../widgets/dosen_bottom_navbar.dart';

class DosenBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const DosenBottomNavbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 239, 84, 40),
      unselectedItemColor: const Color(0xFF949494),
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 0) {
          // Jika "Profile" yang dipilih
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeDosen()),
          );
        }
        if (index == 1) {
          // Jika "Profile" yang dipilih
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileDosen()),
          );
        }
      },
    );
  }
}
