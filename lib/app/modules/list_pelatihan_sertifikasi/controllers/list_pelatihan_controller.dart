import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/list_pelatihan_sertifikasi_service.dart';

class ListPelatihanController extends BaseController {
  final ListPelatihanSertifikasiService lspService = ListPelatihanSertifikasiService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  RxList<Pelatihan> pelatihans = <Pelatihan>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      await loadPelatihans();
    } catch (e) {
      handleError(e);
    }
  }

  Future<void> loadPelatihans() async {
    try {
      isLoading.value = true;
      var data = await lspService.getPelatihans(); // Panggil fungsi API
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


  

  // Future<void> addMedicine(
  //     String pharmacyId, String name, String content, String imageUrl) async {
  //   try {
  //     isLoading.value = true;
  //     await pharmacyService.addMedicine(pharmacyId, name, content, imageUrl);
  //     await loadMedicines(pharmacyId); // Refresh the list
  //     Get.snackbar(
  //       'Sukses',
  //       'Berhasil menambahkan obat',
  //       backgroundColor: Colors.green.shade100,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Gagal menambahkan obat: ${e.toString()}',
  //       backgroundColor: Colors.red.shade100,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> updateMedicine(
  //     String medicineId, String name, String content, String imageUrl) async {
  //   try {
  //     isLoading.value = true;
  //     await pharmacyService.updateMedicine(medicineId, name, content, imageUrl);
  //     // Find and update the medicine in the local list
  //     final index = medicines.indexWhere((med) => med.id == medicineId);
  //     Get.snackbar(
  //       'Sukses',
  //       'Berhasil mengupdate obat',
  //       backgroundColor: Colors.green.shade100,
  //     );
  //     if (index != -1) {
  //       medicines[index] = Medicine(
  //         id: medicineId,
  //         name: name,
  //         content: content,
  //         imageUrl: imageUrl,
  //       );
  //       medicines.refresh(); // Notify GetX to update the UI
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Gagal mengupdate obat: ${e.toString()}',
  //       backgroundColor: Colors.red.shade100,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> deleteMedicine(String medicineId) async {
  //   try {
  //     isLoading.value = true;
  //     await pharmacyService.deleteMedicine(medicineId);
  //     // Remove the medicine from the local list
  //     medicines.removeWhere((med) => med.id == medicineId);
  //     Get.snackbar(
  //       'Sukses',
  //       'Berhasil menghapus obat',
  //       backgroundColor: Colors.green.shade100,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Gagal menghapus obat: ${e.toString()}',
  //       backgroundColor: Colors.red.shade100,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
