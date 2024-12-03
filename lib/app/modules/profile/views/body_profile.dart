import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/profile/controllers/profile_controller.dart';
import '../../../../pages/logout_dialog.dart';
import '../../my_account/views/my_account.dart';
import '../../change_password/views/change_password_page.dart';

class BodyProfile extends StatelessWidget {
  BodyProfile({super.key});
  final ProfileController controller = Get.put((ProfileController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: controller.avatarUrl.isNotEmpty
                  ? NetworkImage(controller.avatarUrl.value) // Gambar dari URL
                  : AssetImage('assets/images/profile-dosen.jpg')
                      as ImageProvider, // Gambar default
            ),
          ),
          const SizedBox(height: 10),
          Obx(() {
            return Text(
              '${controller.namaLengkap.value}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 55, 94, 151),
              ),
            );
          }),
          const SizedBox(height: 20),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              child: Center(
                child: ListTile(
                  title: const Text(
                    'My account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 94, 151),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAccount(),
                      ), // Navigate to MyAccountDosen
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              child: Center(
                child: ListTile(
                  title: const Text(
                    'Change Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 94, 151),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordPage(),
                      ), // Navigate to MyAccountDosen
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              child: Center(
                child: ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 94, 151),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                  onTap: () {
                    // Action for "Logout"
                    LogoutDialog.showLogoutDialog(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
