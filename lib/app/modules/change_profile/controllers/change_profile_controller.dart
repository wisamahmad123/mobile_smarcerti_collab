import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/app/modules/profile/controllers/profile_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/my_account_service.dart';

class ChangeProfileController extends BaseController {
  final MyAccountService _myAccountService = MyAccountService(ApiService());
  final ProfileController controller = Get.put(ProfileController());
  final ApiProvider _apiProvider = ApiProvider();

  // Observable variables for profile data
  RxList<User> changeProfiles = <User>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  var mataKuliahList = <MataKuliahMyAccountModel>[].obs;
  var bidangMinatList = <BidangMinatMyAccountModel>[].obs;

  // Form controllers for profile fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController noTeleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();

  List<String> selectedBidangMinat = [];
  List<String> selectedMataKuliah = [];

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
      await loadBidangMinat(); // Tambahkan ini
      await loadMataKuliah(); // Tambahkan ini
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

      if (data != null && data.isNotEmpty) {
        changeProfiles.assignAll(data);
        User account = data.first;

        // Set data ke TextEditingController
        nameController.text = account.namaLengkap ?? '';
        usernameController.text = account.username ?? '';
        noTeleponController.text = account.noTelp ?? '';
        emailController.text = account.email ?? '';
        jenisKelaminController.text = account.jenisKelamin ?? '';

        // Autoselect Bidang Minat dan Mata Kuliah
        selectedBidangMinat = account.detailDaftarUserBidangMinat!
            .map((e) => e.idBidangMinat.toString())
            .toList();

        selectedMataKuliah = account.detailDaftarUserMatakuliah!
            .map((e) => e.idMatakuliah.toString())
            .toList();
      } else {
        changeProfiles.clear();
      }
    } catch (e) {
      print("Error in loadChangeProfiles: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Pick image from gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImage.value = File(image.path);
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
    return true;
  }

  // Update profile method
  Future<void> updateProfile(BuildContext context) async {
    if (!validateInputs()) return; // Validasi input

    try {
      isLoading.value = true;

      // Menyiapkan data untuk diupdate
      Map<String, dynamic> updateData = {
        'nama_lengkap': nameController.text,
        'username': usernameController.text,
        'id_matakuliah': selectedMataKuliah,
        'id_bidang_minat': selectedBidangMinat,
        'no_telp': noTeleponController.text,
        'email': emailController.text,
        'jenis_kelamin': jenisKelaminController.text,
      };

      // Menambahkan gambar jika ada
      if (profileImage.value != null) {
        updateData['avatar'] = await MultipartFile(
          profileImage.value!.path,
          filename: profileImage.value!.path.split('/').last,
        );
      }

      // Memanggil API update profile
      final response = await _apiProvider.updateProfile(updateData);

      if (response.statusCode == 200) {
        print("Update successful: ${response.data}");
      } else {
        print("Update failed: ${response.statusCode} - ${response.data}");
      }
      if (response.statusCode == 200) {
        // Tampilkan dialog sukses
        Get.snackbar('Success', 'Profile berhasil diupdate');

        // Memuat ulang data terbaru dari server
        await Future.delayed(Duration(seconds: 1));
        await loadChangeProfiles();
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
      await loadChangeProfiles();
      await controller.loadProfiles();
    }
  }

  /// Memuat data bidang minat
  Future<void> loadBidangMinat() async {
    try {
      isLoading.value = true;
      var data = await _myAccountService.getBidangMinat();
      bidangMinatList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil bidang minat: $e");
      errorMessage.value = 'Gagal memuat data bidang minat.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data mata kuliah
  Future<void> loadMataKuliah() async {
    try {
      isLoading.value = true;
      var data = await _myAccountService.getMataKuliah();
      mataKuliahList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil mata kuliah: $e");
      errorMessage.value = 'Gagal memuat data mata kuliah.';
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
