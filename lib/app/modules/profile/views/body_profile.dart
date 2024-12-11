import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:mobile_smarcerti/app/modules/profile/controllers/profile_controller.dart';
import '../../../../pages/logout_dialog.dart';
import '../../my_account/views/my_account.dart';
import '../../change_password/views/change_password_page.dart';

class BodyProfile extends StatelessWidget {
  BodyProfile({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() {
              // Menampilkan loader saat data sedang dimuat
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // Menampilkan pesan jika tidak ada data
              if (controller.avatarUrl.isEmpty) {
                return const Center(child: Text('No data available'));
              }

              final account = controller.avatarUrl.value;

              return Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: account.isNotEmpty
                        ? NetworkImage(account) // Gambar dari URL
                        : AssetImage('assets/images/profile-dosen.jpg')
                            as ImageProvider, // Gambar default
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.namaLengkap.value ?? 'Unknown User',
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

            // Card untuk navigasi "My Account"
            _buildMenuCard(
              context,
              title: 'My Account',
              icon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyAccount(),
                  ),
                );
              },
            ),

            // Card untuk navigasi "Change Password"
            _buildMenuCard(
              context,
              title: 'Change Password',
              icon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ),
                );
              },
            ),

            // Card untuk Logout
            _buildMenuCard(
              context,
              title: 'Logout',
              icon: Icons.arrow_forward_ios,
              onTap: () {
                LogoutDialog.showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk membuat menu Card
  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color.fromARGB(255, 55, 94, 151),
          ),
        ),
        trailing: Icon(
          icon,
          color: const Color.fromARGB(255, 55, 94, 151),
        ),
        onTap: onTap,
      ),
    );
  }
}
