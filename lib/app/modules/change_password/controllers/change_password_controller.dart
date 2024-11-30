import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/change_profile_service.dart';

class ChangePasswordController extends GetxController {
  final ChangeProfileService _profileService =
      ChangeProfileService(ApiService());

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isOldPasswordVisible = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  // Validate input fields
  bool validateInputs() {
    if (oldPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Password lama harus diisi');
      return false;
    }
    if (newPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Password baru harus diisi');
      return false;
    }
    if (newPasswordController.text.length < 5) {
      Get.snackbar('Error', 'Password baru minimal 5 karakter');
      return false;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Konfirmasi password tidak cocok');
      return false;
    }
    return true;
  }

  // Update password method
  Future<void> updatePassword() async {
    if (!validateInputs()) return;

    try {
      isLoading.value = true;

      final result = await _profileService.updatePassword(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text,
      );

      if (result['success']) {
        // Clear controllers after successful update
        oldPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();

        Get.snackbar(
          'Sukses',
          result['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          result['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
