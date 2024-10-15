import 'package:flutter/material.dart';
import '../widgets/app_bar_profile.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen
import '../widgets/body_profile_dosen.dart';

class ProfileDosen extends StatelessWidget {
  const ProfileDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarProfile(title: 'Profile'), // AppBar yang dipisahkan
      body: BodyProfileDosen(),               // Body yang dipisahkan
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 1), // BottomNav yang dipisahkan
    );
  }
}
