import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/pimpinan_bottom_nav_bar.dart';
import 'home_body.dart';

class HomePimpinan extends StatelessWidget {
  HomePimpinan({super.key});
  final HomeController controller = Get.put(HomeController());
  final MyAccountController control = Get.put(MyAccountController());

  // Simulasi delay sebelum merender semua
  Future<void> _simulateLoading() async {
    await Future.delayed(Duration(milliseconds: 100)); // Delay 0,5 detik
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _simulateLoading(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Sementara menampilkan loading
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()), // Loading Indicator
            backgroundColor: Colors.white,
          );
        }

        // Setelah selesai loading, render semua elemen
        return Scaffold(
          appBar: CustomAppBar(),
          body: HomeBody(role: 'pimpinan'),
          bottomNavigationBar:  PimpinanBottomNavBar(currentIndex: 0),
        );
      },
    );
  }
}
