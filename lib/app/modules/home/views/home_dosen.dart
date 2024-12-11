import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/pimpinan_bottom_nav_bar.dart';
import 'home_body.dart';

class HomeDosen extends StatelessWidget {
  HomeDosen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // Setelah selesai loading, render semua elemen
    return Scaffold(
      appBar: CustomAppBar(),
      body: HomeBody(role: 'dosen'),
      bottomNavigationBar: const DosenBottomNavbar(currentIndex: 0),
    );
  }
}
