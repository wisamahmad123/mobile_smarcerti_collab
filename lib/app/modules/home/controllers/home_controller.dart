import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends BaseController {
  final HomeService _homeService = HomeService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  final error = Rx<String?>(null);
  final userData = Rx<User?>(null);
  var namaLengkap = ''.obs; // State reaktif untuk nama lengkap
  RxList<PelatihanUser> pelatihans = <PelatihanUser>[].obs;
  RxList<Pelatihan> pelatihansDosen =
      <Pelatihan>[].obs; // Untuk data yang ditampilkan
  RxList<Sertifikasi> sertifikasis =
      <Sertifikasi>[].obs; // Untuk data yang ditampilkan
  RxList<Sertifikasi> sertifikasisDosen = <Sertifikasi>[].obs;

  @override
  void onInit() {
    super.onInit();
    update(); // Force UI update
    loadNamaLengkap();
    loadPelatihans(); // Ambil data pelatihan
    loadSertifikasis(); // Ambil data sertifikasi
    loadPelatihansDosen();
    loadSertifikasisDosen();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    update(); // Force UI update
    loadNamaLengkap();
    loadPelatihans(); // Ambil data pelatihan
    loadSertifikasis(); // Ambil data sertifikasi
    loadPelatihansDosen();
    loadSertifikasisDosen(); // Memuat ulang data setiap kali halaman ditampilkan kembali
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('nama_lengkap'));
  }

  Future<void> loadNamaLengkap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama = prefs.getString('nama_lengkap');
    namaLengkap.value = nama ?? 'User'; // Update nilai reaktif
  }

  int getTotalPelatihan() => pelatihans.length;
  int getTotalSertifikasi() => sertifikasis.length;
  int getTotalPelatihanDosen() => pelatihansDosen.length;
  int getTotalSertifikasiDosen() => sertifikasisDosen.length;

  /// Fungsi untuk mengambil daftar pelatihan
  Future<void> loadPelatihans() async {
    try {
      isLoading.value = true; // Menandakan loading dimulai
      var data = await _homeService.getPelatihans(); // Memanggil API
      if (data.isNotEmpty) {
        pelatihans.assignAll(data); // Masukkan data ke observable
      } else {
        pelatihans.clear(); // Hapus data lama jika tidak ada data baru
      }
    } catch (e) {
      print("Error saat mengambil pelatihan: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }

  /// Memuat daftar sertifikasi
  Future<void> loadSertifikasis() async {
    try {
      isLoading.value = true;
      var data = await _homeService.getSertifikasis();
      sertifikasis.assignAll(data);
    } catch (e) {
      print("Error saat mengambil sertifikasi: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadPelatihansDosen() async {
    try {
      isLoading.value = true;
      var data = await _homeService.getPelatihansDosen(); // Panggil fungsi API
      if (data.isNotEmpty) {
        pelatihansDosen.assignAll(data); // Masukkan data ke dalam observable
      } else {
        pelatihansDosen.clear(); // Pastikan tidak ada data lama
      }
    } catch (e) {
      print("Error saat mengambil pelatihan: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }

  Future<void> loadSertifikasisDosen() async {
    try {
      isLoading.value = true;
      var data =
          await _homeService.getSertifikasisDosen(); // Panggil fungsi API
      if (data.isNotEmpty) {
        sertifikasisDosen.assignAll(data); // Masukkan data ke dalam observable
      } else {
        sertifikasisDosen.clear(); // Pastikan tidak ada data lama
      }
    } catch (e) {
      print("Error saat mengambil sertifikasi: $e");
    } finally {
      isLoading.value = false; // Pastikan loading selesai
    }
  }
}
