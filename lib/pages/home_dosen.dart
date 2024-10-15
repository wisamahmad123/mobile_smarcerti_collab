import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/dosen_bottom_navbar.dart'; 
import '../widgets/home_body.dart'; // Jika ini diperlukan

class HomeDosen extends StatelessWidget {
  const HomeDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Text('Ini home dosen '),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 0), // Menyertakan currentIndex
    );
  }
}
