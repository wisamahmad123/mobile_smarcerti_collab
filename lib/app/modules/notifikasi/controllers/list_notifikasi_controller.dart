import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_sertfikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/notifikasi_service.dart';

class ListNotifikasiController extends BaseController {
  final NotifikasiService lspService = NotifikasiService(ApiService());

  // Observable untuk daftar sertifikasi dan detail sertifikasi
  RxList<Sertifikasi> sertifikasis = <Sertifikasi>[].obs;
  Rx<Sertifikasi?> sertifikasiDetail = Rx<Sertifikasi?>(null);

  RxList<PelatihanUser> pelatihans = <PelatihanUser>[].obs;
  Rx<PelatihanUser?> pelatihanDetail = Rx<PelatihanUser?>(null);

  // List observables untuk vendor, bidang minat, dan mata kuliah
  var jenisPelatihanList = <JenisPelatihan>[].obs;
  var vendorPelatihanList = <VendorPelatihan>[].obs;
  var jenisSertifikasiList = <JenisSertifikasi>[].obs;
  var vendorSertifikasiList = <VendorSertifikasi>[].obs;
  var bidangMinatList = <BidangMinatSertifikasi>[].obs;
  var mataKuliahList = <MataKuliahSertifikasi>[].obs;

  var tahunPeriode = <Periode>[].obs;

  // Loading dan error handling
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  /// Inisialisasi data
  Future<void> initializeData() async {
    await Future.wait([
      loadSertifikasis(),
      loadVendorSertifikasis(),
      loadPelatihans(),
      loadVendorPelatihans(),
      loadBidangMinat(),
      loadMataKuliah(),
      loadPeriode(),
    ]);
  }

  /// Memuat daftar sertifikasi
  Future<void> loadSertifikasis() async {
    try {
      isLoading.value = true;
      var data = await lspService.getSertifikasis();
      sertifikasis.assignAll(data);
    } catch (e) {
      print("Error saat mengambil sertifikasi: $e");
      errorMessage.value = 'Gagal memuat data sertifikasi.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat detail sertifikasi berdasarkan ID
  Future<void> loadSertifikasiById(int id) async {
    try {
      isLoading.value = true;
      Sertifikasi sertifikasi = await lspService.getSertifikasiById(id);
      sertifikasiDetail.value = sertifikasi;
    } catch (e) {
      print("Error: $e");
      errorMessage.value = 'Gagal memuat detail sertifikasi.';
      sertifikasiDetail.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data vendor
  Future<void> loadVendorSertifikasis() async {
    try {
      isLoading.value = true;
      var data = await lspService.getVendorsertifikasi();
      vendorSertifikasiList.assignAll(data); // Perbaiki untuk mengisi ke vendorList
    } catch (e) {
      print("Error saat mengambil vendor sertifikasi: $e");
      errorMessage.value = 'Gagal memuat data vendor sertifikasi.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch data jenis sertifikasi dari API
  Future<void> loadJenisSertifikasi() async {
    try {
      isLoading.value = true;
      var data = await lspService.getJenisSertifikasi();
      jenisSertifikasiList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil jenis sertifikasi: $e");
      errorMessage.value = 'Gagal memuat data jenis sertifikasi.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat daftar pelatihan
  Future<void> loadPelatihans() async {
    try {
      isLoading.value = true;
      var data = await lspService.getPelatihans();
      pelatihans.assignAll(data);
    } catch (e) {
      print("Error saat mengambil pelatihan: $e");
      errorMessage.value = 'Gagal memuat data pelatihan.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat detail pelatihan berdasarkan ID
  Future<void> loadSPelatihanById(int id) async {
    try {
      isLoading.value = true;
      PelatihanUser pelatihanUser = await lspService.getPelatihanById(id);
      pelatihanDetail.value = pelatihanUser;
    } catch (e) {
      print("Error: $e");
      errorMessage.value = 'Gagal memuat detail pelatihan.';
      pelatihanDetail.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data vendor
  Future<void> loadVendorPelatihans() async {
    try {
      isLoading.value = true;
      var data = await lspService.getVendorPelatihan();
      vendorPelatihanList.assignAll(data); // Perbaiki untuk mengisi ke vendorList
    } catch (e) {
      print("Error saat mengambil vendor pelatihan: $e");
      errorMessage.value = 'Gagal memuat data vendor pelatihan.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch data jenis pelatihan dari API
  Future<void> loadJenisPelatihan() async {
    try {
      isLoading.value = true;
      var data = await lspService.getJenisPelatihan();
      jenisPelatihanList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil jenis pelatihan: $e");
      errorMessage.value = 'Gagal memuat data jenis pelatihan.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data periode
  Future<void> loadPeriode() async {
    try {
      isLoading.value = true;
      var data = await lspService.getPeriode();
      tahunPeriode.assignAll(data);
    } catch (e) {
      print("Error saat mengambil periode: $e");
      errorMessage.value = 'Gagal memuat data periode.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data bidang minat
  Future<void> loadBidangMinat() async {
    try {
      isLoading.value = true;
      var data = await lspService.getBidangMinat();
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
      var data = await lspService.getMataKuliah();
      mataKuliahList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil mata kuliah: $e");
      errorMessage.value = 'Gagal memuat data mata kuliah.';
    } finally {
      isLoading.value = false;
    }
  }
}
