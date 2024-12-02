import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/change_password/controllers/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  final ChangePasswordController controller =
      Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Old Password TextField
              Obx(() => TextField(
                    controller: controller.oldPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Password Lama',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isOldPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () =>
                            controller.isOldPasswordVisible.toggle(),
                      ),
                    ),
                    obscureText: !controller.isOldPasswordVisible.value,
                  )),
              const SizedBox(height: 20),
              // New Password TextField
              Obx(() => TextField(
                    controller: controller.newPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Password Baru',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isNewPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () =>
                            controller.isNewPasswordVisible.toggle(),
                      ),
                    ),
                    obscureText: !controller.isNewPasswordVisible.value,
                  )),
              const SizedBox(height: 20),
              // Confirm New Password TextField
              Obx(() => TextField(
                    controller: controller.confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Ulangi Password Baru',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isConfirmPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () =>
                            controller.isConfirmPasswordVisible.toggle(),
                      ),
                    ),
                    obscureText: !controller.isConfirmPasswordVisible.value,
                  )),
              const SizedBox(height: 20),
              // Save Button
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.updatePassword(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF375E97),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : const Text('Simpan'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
