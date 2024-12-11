import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/request_acc_page.dart';
import '../app/modules/home/views/home_pimpinan.dart';
import '../app/modules/profile/views/profile_pimpinan.dart'; // Pastikan import ini ada
import 'package:get/get.dart';

class PimpinanBottomNavBar extends StatelessWidget {
  final int currentIndex;

  PimpinanBottomNavBar({super.key, required this.currentIndex});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print('currentIndex: $currentIndex'); // Debug log

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: currentIndex == -1
          ? Colors.grey
          : const Color.fromARGB(255, 239, 84, 40),
      unselectedItemColor: Colors.grey,
      currentIndex: (currentIndex < 0 || currentIndex >= 2) ? 0 : currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 0) {
          Get.offAllNamed('/homePimpinan');
        } else if (index == 1) {
          Get.offAllNamed('/profile');
        }
      },
    );
  }
}
