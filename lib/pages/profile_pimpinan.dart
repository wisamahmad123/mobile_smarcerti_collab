import 'package:flutter/material.dart';
import '../widgets/app_bar_profile.dart';       // Custom AppBar
import '../widgets/pimpinan_bottom_nav_bar.dart'; // BottomNavigationBar untuk dosen
import '../widgets/body_profile.dart';

class ProfilePimpinan extends StatelessWidget {
  const ProfilePimpinan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarProfile(title: 'Profile'), // AppBar yang dipisahkan
      body: BodyProfile(),               // Body yang dipisahkan
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: 1), // BottomNav yang dipisahkan
    );
  }
}