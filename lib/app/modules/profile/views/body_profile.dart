import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:mobile_smarcerti/app/modules/profile/controllers/profile_controller.dart';
import '../../../../pages/logout_dialog.dart';
import '../../my_account/views/my_account.dart';
import '../../change_password/views/change_password_page.dart';

class BodyProfile extends StatelessWidget {
  BodyProfile({super.key});
  final MyAccountController controller = Get.put((MyAccountController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.myAccounts.isEmpty) {
              return const Center(child: Text('No data available'));
            }
            final account = controller.myAccounts.first;
            return Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: account.avatarUrl.isNotEmpty
                      ? NetworkImage(account.avatarUrl)
                      : const AssetImage('assets/images/profile-dosen.jpg')
                          as ImageProvider,
                ),
                const SizedBox(height: 10),
                Text(
                  '${account.namaLengkap}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 94, 151),
                  ),
                ),
              ],
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
                      ),
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
