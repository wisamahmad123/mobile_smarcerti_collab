import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/list_pelatihan_sertifikasi_service.dart';
import 'package:mobile_smarcerti/services/req_acc_service.dart';

class ReqAccController extends BaseController {
  final ReqAccService reqService = ReqAccService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  RxList<Pelatihan> pelatihans = <Pelatihan>[].obs;
  RxList<Sertifikasi> sertifikasis = <Sertifikasi>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      await loadReqPelatihans();
      await loadReqSertifikasis();
    } catch (e) {
      handleError(e);
    }
  }

  // Fungsi untuk refresh data
  Future<void> onRefreshPelatihans() async {
      await loadReqPelatihans(); // Panggil fungsi untuk ambil ulang data pelatihan
  }
  // Fungsi untuk refresh data
  Future<void> onRefreshSertifikasis() async {
      await loadReqPelatihans(); // Panggil fungsi untuk ambil ulang data pelatihan
  }

  Future<void> loadReqPelatihans() async {
    try {
      isLoading.value = true;
      var data = await reqService.getReqPelatihans(); // Panggil fungsi API
      print("data reqpelatihan = $data");
      if (data.isNotEmpty) {
        pelatihans.assignAll(data); // Masukkan data ke dalam observable
      } else {
        pelatihans.clear(); // Pastikan tidak ada data lama
      }
    } catch (e) {
      print("Error saat mengambil pelatihan: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }

  Future<void> loadReqSertifikasis() async {
    try {
      isLoading.value = true;
      var data = await reqService.getReqSertifikasis(); // Panggil fungsi API
      if (data.isNotEmpty) {
        sertifikasis.assignAll(data); // Masukkan data ke dalam observable
      } else {
        sertifikasis.clear(); // Pastikan tidak ada data lama
      }
    } catch (e) {
      print("Error saat mengambil pelatihan: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }

  Future<void> updateStatusPelatihan(String status, String id) async {
    try {
      isLoading.value = true;
      await reqService.updateStatusPelatihan(status, id); // Panggil fungsi API
      print("tes");
    } catch (e) {
      print("Error saat update status: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
      await loadReqPelatihans();
    }
  }

  Future<void> updateStatusSertifikasi(String status, String id) async {
    try {
      isLoading.value = true;
      await reqService.updateStatusSertifikasi(status, id); // Panggil fungsi API
      print("tes");
    } catch (e) {
      print("Error saat update status: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
      await loadReqSertifikasis();
    }
  }
}
