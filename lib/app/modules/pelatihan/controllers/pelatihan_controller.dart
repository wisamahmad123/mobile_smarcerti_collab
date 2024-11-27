

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/pelatihan_api.dart';

class PelatihanController extends BaseController {
  final PelatihanService pelatihanService = PelatihanService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  RxList<PelatihanUser> pelatihans = <PelatihanUser>[].obs; // Daftar pelatihan
  RxBool isLoading = false.obs; // Indikator loading
  RxString errorMessage = ''.obs; // Pesan error
  Rx<PelatihanUser?> pelatihanDetail = Rx<PelatihanUser?>(null); // Detail pelatihan

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  /// Inisialisasi data pelatihan
  Future<void> initializeData() async {
    try {
      await loadPelatihans();
    } catch (e) {
      handleError(e);
    }
  }

  /// Fungsi untuk mengambil daftar pelatihan
  Future<void> loadPelatihans() async {
    try {
      isLoading.value = true; // Menandakan loading dimulai
      var data = await pelatihanService.getPelatihans(); // Memanggil API
      if (data.isNotEmpty) {
        pelatihans.assignAll(data); // Masukkan data ke observable
      } else {
        pelatihans.clear(); // Hapus data lama jika tidak ada data baru
      }
    } catch (e) {
      print("Error saat mengambil pelatihan: $e");
      errorMessage.value = 'Gagal memuat data pelatihan: $e';
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }

  /// Fungsi untuk memuat detail pelatihan berdasarkan ID
  Future<void> loadPelatihanById(int id) async {
    isLoading.value = true; // Menandakan loading dimulai
    try {
      // Memanggil fungsi API untuk mendapatkan detail pelatihan
      PelatihanUser pelatihan = await pelatihanService.getPelatihanById(id);
      pelatihanDetail.value = pelatihan; // Menyimpan detail pelatihan
    } catch (e) {
      // Jika terjadi error, reset nilai pelatihanDetail
      print('Error saat mengambil detail pelatihan: $e');
      pelatihanDetail.value = null;
      errorMessage.value = 'Gagal memuat detail pelatihan: $e';
    } finally {
      isLoading.value = false; // Menandakan loading selesai
    }
  }
}
