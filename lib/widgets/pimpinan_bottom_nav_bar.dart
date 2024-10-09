// widget widgets/pimpimpinan_bottom_nav_bar.dart
import 'package:flutter/material.dart';
import '../pages/home_page.dart'; // Import halaman Home
import '../pages/history_page.dart'; // Import halaman History
import '../pages/profile_page.dart'; // Import halaman Profile

class PimpinanBottomNavBar extends StatefulWidget {
  const PimpinanBottomNavBar({super.key});

  @override
  _PimpinanBottomNavBarState createState() => _PimpinanBottomNavBarState();
}

class _PimpinanBottomNavBarState extends State<PimpinanBottomNavBar> {
  int _selectedIndex = 0; // Index halaman yang dipilih

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Perbarui index yang dipilih
      // Ganti halaman menggunakan Navigator
      if (index == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else if (index == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HistoryPage()));
      } else if (index == 2) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 35),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, size: 35),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 35),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex, // Indeks yang aktif
      unselectedItemColor: 
          const Color.fromARGB(255, 156, 156, 156),
      onTap: _onItemTapped, // Panggil fungsi saat item diklik
      selectedItemColor:
          const Color.fromARGB(255, 239, 84, 40), // Warna item yang dipilih
    );
  }
}
