import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/my_account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeProfileController extends BaseController {
  final MyAccountService _myAccountService = MyAccountService(ApiService());
  final HomeController homeController = Get.put(HomeController());
  final MyAccountController myAccountController =
      Get.put(MyAccountController());
  final ApiProvider _apiProvider = ApiProvider();

  // Observable variables for profile data
  RxList<User> changeProfiles = <User>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxString selectedJenisKelamin = ''.obs;
  // Form controllers for profile fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController noTeleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();

  // Observable for profile image
  Rx<File?> profileImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  // Initialize data and load existing profile
  Future<void> initializeData() async {
    try {
      await loadChangeProfiles();
    } catch (e) {
      handleError(e);
    }
  }

  // Load existing profile data
  Future<void> loadChangeProfiles() async {
    try {
      isLoading.value = true;
      var data = await _myAccountService.getChangeProfiles();

      print(User());

      if (data.isNotEmpty) {
        changeProfiles.assignAll(data);
        User account = data.first;

        // Set data ke TextEditingController
        nameController.text = account.namaLengkap ?? '';
        usernameController.text = account.username ?? '';
        noTeleponController.text = account.noTelp ?? '';
        emailController.text = account.email ?? '';
        selectedJenisKelamin.value = account.jenisKelamin ?? '';
      } else {
        changeProfiles.clear();
      }
    } catch (e) {
      print("Error in loadChangeProfiles: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Validate input fields
  bool validateInputs() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Nama Lengkap harus diisi',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      Get.snackbar('Error', 'Email tidak valid',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedJenisKelamin.value.isEmpty) {
      Get.snackbar('Error', 'Jenis Kelamin harus dipilih',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  // Update profile method
  Future<void> updateProfile(BuildContext context) async {
    if (!validateInputs()) return;

    try {
      isLoading.value = true;

      await Future.delayed(Duration(seconds: 1));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('nama_lengkap', nameController.text);

      // Menyiapkan data untuk diupdate
      Map<String, dynamic> updateData = {
        'nama_lengkap': nameController.text,
        'username': usernameController.text,
        'no_telp': noTeleponController.text,
        'email': emailController.text,
        'jenis_kelamin': selectedJenisKelamin.value,
      };

      print("Update Data: $updateData");

      // Memanggil API update profile dan mendapatkan User yang diupdate
      final updatedUser = await _apiProvider.updateProfile(updateData);

      if (updatedUser != null) {
        // Update changeProfiles dengan user baru
        changeProfiles.value = [updatedUser];

        // Update UI dan controller lain
        Get.snackbar('Success', 'Profile berhasil diupdate');
        await Future.delayed(Duration(seconds: 1));
        await loadChangeProfiles();
        await homeController.loadNamaLengkap();
        await myAccountController.loadMyAccoutns();
        print(
            "Nama lengkap setelah update: ${homeController.namaLengkap.value}");
        homeController.update();
      } else {
        Get.snackbar('Error', 'Gagal memperbarui profil',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error updating profile: $e");
      Get.snackbar('Error', 'Terjadi kesalahan: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    usernameController.dispose();
    noTeleponController.dispose();
    emailController.dispose();
    jenisKelaminController.dispose();
    super.onClose();
  }
}
