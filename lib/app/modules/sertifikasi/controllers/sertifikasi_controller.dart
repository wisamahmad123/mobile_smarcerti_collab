import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/list_pelatihan_sertifikasi_service.dart';
import 'package:mobile_smarcerti/services/sertifikasi_service.dart';

class SertifikasiController extends BaseController {
  final SertifikasiService lspService = SertifikasiService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  RxList<Sertifikasi> sertifikasis = <Sertifikasi>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  // Deklarasi sertifikasiDetail di controller
  Rx<Sertifikasi?> sertifikasiDetail = Rx<Sertifikasi?>(null);


  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      await loadSertifikasis();
    } catch (e) {
      handleError(e);
    }
  }
// Fungsi untuk mengambil daftar sertifikasi
  Future<void> loadSertifikasis() async {
    try {
      isLoading.value = true;
      var data = await lspService.getSertifikasis(); // Panggil fungsi API
      if (data.isNotEmpty) {
        sertifikasis.assignAll(data); // Masukkan data ke dalam observable
      } else {
        sertifikasis.clear(); // Pastikan tidak ada data lama
      }
    } catch (e) {
      print("Error saat mengambil sertifikasi: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }

  // Fungsi untuk memuat detail sertifikasi berdasarkan ID
  Future<void> loadSertifikasiById(int id) async {
    isLoading.value = true; // Menandakan loading dimulai
    try {
      // Memanggil fungsi API untuk mendapatkan sertifikasi berdasarkan ID
      Sertifikasi sertifikasi = await lspService.getSertifikasiById(id);
      sertifikasiDetail.value = sertifikasi; // Menyimpan data sertifikasi
    } catch (e) {
      // Jika terjadi error, cetak error dan reset nilai sertifikasiDetail
      print('Error: $e');
      sertifikasiDetail.value = null;
    } finally {
      isLoading.value = false; // Menandakan loading selesai
    }
  }

  


  
}
