
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/req_acc_service.dart';

class ReqAccController extends BaseController {
  final ReqAccService reqService = ReqAccService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  RxList<Pelatihan> pelatihans = <Pelatihan>[].obs;
  RxList<Pelatihan> filteredPelatihan = <Pelatihan>[].obs; // Untuk data yang ditampilkan
  RxList<Sertifikasi> filteredSertifikasi = <Sertifikasi>[].obs; // Untuk data yang ditampilkan
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
      filteredPelatihan.assignAll(pelatihans); // Default semua data saat inisialisasi
      filteredSertifikasi.assignAll(sertifikasis); // Default semua data saat inisialisasi
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

  void searchPelatihan(String query) {
  if (query.isEmpty) {
    filteredPelatihan.assignAll(pelatihans); // Jika kosong, tampilkan semua
  } else {
    filteredPelatihan.assignAll(pelatihans.where((pelatihan) {
      return pelatihan.namaPelatihan
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList());
  }
}
  void searchSertifikasi(String query) {
  if (query.isEmpty) {
    filteredSertifikasi.assignAll(sertifikasis); // Jika kosong, tampilkan semua
  } else {
    filteredSertifikasi.assignAll(sertifikasis.where((sertifikasi) {
      return sertifikasi.namaSertifikasi
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList());
  }
}

void filterPeriodePelatihan(String periode) {
  if (periode == "Semua") {
    filteredPelatihan.assignAll(pelatihans); // Semua data
  } else {
    filteredPelatihan.assignAll(pelatihans.where((pelatihan) {
      return pelatihan.periode.tahunPeriode.contains(periode);
    }).toList());
  }
}
void filterPeriodeSertifikasi(String periode) {
  if (periode == "Semua") {
    filteredSertifikasi.assignAll(sertifikasis); // Semua data
  } else {
    filteredSertifikasi.assignAll(sertifikasis.where((sertifikasi) {
      return sertifikasi.periode.tahunPeriode.contains(periode);
    }).toList());
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
      await initializeData();
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
      await initializeData();
    }
  }
}
