import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Profil'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(21, 174, 174, 174),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigasi ke LoginPage saat tombol ditekan
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('Logout'),
          ),
        ),
      ),
      bottomNavigationBar: const PimpinanBottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}
