import 'package:flutter/material.dart';
import '../widgets/app_bar_profile.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen
import '../app/modules/profile/views/body_profile.dart';

class ProfileDosen extends StatelessWidget {
  const ProfileDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfile(title: 'Profile'), // AppBar yang dipisahkan
      body: BodyProfile(),               // Body yang dipisahkan
      bottomNavigationBar: const DosenBottomNavbar(currentIndex: 1), // BottomNav yang dipisahkan
    );
  }
}
