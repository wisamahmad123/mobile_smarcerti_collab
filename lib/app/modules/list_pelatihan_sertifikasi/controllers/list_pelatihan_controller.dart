import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/list_pelatihan_sertifikasi_service.dart';

class ListPelatihanController extends BaseController {
  final ListPelatihanSertifikasiService lspService =
      ListPelatihanSertifikasiService(ApiService());
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
      await loadPelatihans();
      await loadSertifikasis();
      filteredPelatihan.assignAll(pelatihans); // Default semua data saat inisialisasi
      filteredSertifikasi.assignAll(sertifikasis); // Default semua data saat inisialisasi
    } catch (e) {
      handleError(e);
    }
  }

   // Fungsi untuk refresh data
  Future<void> onRefreshPelatihans() async {
      await loadPelatihans(); // Panggil fungsi untuk ambil ulang data pelatihan
  }
  // Fungsi untuk refresh data
  Future<void> onRefreshSertifikasis() async {
      await loadSertifikasis(); // Panggil fungsi untuk ambil ulang data pelatihan
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

}
