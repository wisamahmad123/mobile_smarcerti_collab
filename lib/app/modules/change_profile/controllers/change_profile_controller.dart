import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/my_account_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/change_profile_service.dart';
import 'package:mobile_smarcerti/widgets/popup.dart';

class ChangeProfileController extends BaseController {
  final ChangeProfileService _profileService =
      ChangeProfileService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();

  // Observable variables for profile data
  RxList<MyAccount> changeProfiles = <MyAccount>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // Form controllers for profile fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController noTeleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();

  RxList<MataKuliahMyAccountModel> allMataKuliahList =
      <MataKuliahMyAccountModel>[].obs;
  RxList<BidangMinatMyAccountModel> allBidangMinatList =
      <BidangMinatMyAccountModel>[].obs;

  // Observable lists for Mata Kuliah and Bidang Minat
  RxList<MataKuliahMyAccountModel> mataKuliahList =
      <MataKuliahMyAccountModel>[].obs;
  RxList<BidangMinatMyAccountModel> bidangMinatList =
      <BidangMinatMyAccountModel>[].obs;

  // Dropdown selection for Mata Kuliah and Bidang Minat
  Rx<MataKuliahMyAccountModel?> selectedMataKuliah =
      Rx<MataKuliahMyAccountModel?>(null);
  Rx<BidangMinatMyAccountModel?> selectedBidangMinat =
      Rx<BidangMinatMyAccountModel?>(null);

  // Observable for profile image
  Rx<File?> profileImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    initializeData();
    // fetchAllMataKuliah();
    // fetchAllBidangMinat();
  }

  // Initialize data and load existing profile
  Future<void> initializeData() async {
    try {
      await loadChangeProfiles();
    } catch (e) {
      handleError(e);
    }
  }

//   Future<void> fetchAllMataKuliah() async {
//     try {
//       isLoading.value = true;
//       // You'll need to implement this method in your ApiProvider or Service
//       var result = await _profileService.getAllMataKuliah();
//       allMataKuliahList.value = result;
//     } catch (e) {
//       print("Error fetching all Mata Kuliah: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

// // New method to fetch all Bidang Minat
//   Future<void> fetchAllBidangMinat() async {
//     try {
//       isLoading.value = true;
//       // You'll need to implement this method in your ApiProvider or Service
//       var result = await _profileService.getAllBidangMinat();
//       allBidangMinatList.value = result;
//     } catch (e) {
//       print("Error fetching all Bidang Minat: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

  // Load existing profile data
  Future<void> loadChangeProfiles() async {
    try {
      isLoading.value = true;
      print("Fetching my accounts data...");

      var data = await _profileService.getChangeProfiles();
      print("Raw API Response: $data");

      if (data != null && data.isNotEmpty) {
        changeProfiles.assignAll(data);

        // Populate text controllers with existing data
        MyAccount account = data.first;
        nameController.text = account.namaLengkap ?? '';
        usernameController.text = account.username ?? '';
        mataKuliahList.value = account.detailDaftarUserMatakuliah;
        bidangMinatList.value = account.detailDaftarUserBidangMinat;
        noTeleponController.text = account.noTelp ?? '';
        emailController.text = account.email ?? '';
        jenisKelaminController.text = account.jenisKelamin ?? '';
      } else {
        print("No data received from API");
        changeProfiles.clear();
      }
    } catch (e) {
      print("Error in loadChangeProfiles: $e");
      print("Stack trace: ${e.toString()}");
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
        'mata_kuliah_id': selectedMataKuliah.value?.idMatakuliah,
        'bidang_minat_id': selectedBidangMinat.value?.idBidangMinat,
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
      print("Response: $response");
      print("Update Data Sent: $updateData");
      if (response.statusCode == 200) {
        print("Update successful: ${response.data}");
      } else {
        print("Update failed: ${response.statusCode} - ${response.data}");
      }
      if (response.statusCode == 200) {
        // Tampilkan dialog sukses
        Popup.showStatusProfileDialog(context);

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
