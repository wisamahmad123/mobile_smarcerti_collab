import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_sertfikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';
import 'package:mobile_smarcerti/services/sertifikasi_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class SertifikasiController extends BaseController {
  final SertifikasiService lspService = SertifikasiService(ApiService());
  final PdfService pdfService = PdfService();

  // Observable untuk daftar sertifikasi dan detail sertifikasi
  RxList<Sertifikasi> sertifikasis = <Sertifikasi>[].obs;
  Rx<Sertifikasi?> sertifikasiDetail = Rx<Sertifikasi?>(null);
   RxList<Sertifikasi> filteredSertifikasi = <Sertifikasi>[].obs; // 

  // List observables untuk vendor, bidang minat, dan mata kuliah
  var vendorList = <VendorSertifikasi>[].obs;
  var bidangMinatList = <BidangMinatSertifikasi>[].obs;
  var mataKuliahList = <MataKuliahSertifikasi>[].obs;
  var jenisSertifikasiList = <JenisSertifikasi>[].obs;

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
      loadVendors(),
      loadBidangMinat(),
      loadMataKuliah(),
      loadPeriode(),
    ]);
  }

    // Fungsi untuk refresh data
  Future<void> onRefreshSertifikasis() async {
      await loadSertifikasis(); // Panggil fungsi untuk ambil ulang data pelatihan
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

  /// Memuat data vendor
  Future<void> loadVendors() async {
    try {
      isLoading.value = true;
      var data = await lspService.getVendorsertifikasi();
      vendorList.assignAll(data); // Perbaiki untuk mengisi ke vendorList
    } catch (e) {
      print("Error saat mengambil vendor sertifikasi: $e");
      errorMessage.value = 'Gagal memuat data vendor sertifikasi.';
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

  /// Menambahkan sertifikasi baru
  Future<void> createSertifikasi(Map<String, dynamic> data) async {
    isLoading.value = true;

    try {
      final Sertifikasi? result = await lspService.createSertifikasi(data);
      if (result != null) {
        sertifikasis.add(result); // Tambahkan sertifikasi baru ke daftar
        Get.snackbar(
          'Berhasil',
          'Sertifikasi berhasil ditambahkan.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        errorMessage.value = 'Gagal membuat sertifikasi.';
        Get.snackbar(
          'Gagal',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = 'Gagal membuat sertifikasi: $e';
      Get.snackbar(
        'Gagal',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Mengupdate sertifikasi
  Future<void> updateSertifikasi(int id, Map<String, dynamic> data) async {
    isLoading.value = true;
    try {
      final Sertifikasi? result = await lspService.updateSertifikasi(id, data);
      if (result != null) {
        Get.snackbar(
          'Berhasil',
          'Sertifikasi berhasil diperbarui.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        errorMessage.value = 'Gagal memperbarui sertifikasi.';
        Get.snackbar(
          'Gagal',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = 'Gagal memperbarui sertifikasi: $e';
      Get.snackbar(
        'Gagal',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Unduh file PDF
  Future<void> downloadPdf(String fileName, String fileUrl) async {
    PermissionStatus permissionStatus = await Permission.storage.request();
    if (permissionStatus.isGranted) {
      try {
        Directory? directory = await getExternalStorageDirectory();
        directory ??= await getApplicationDocumentsDirectory();

        String sanitizedFileName = sanitizeFileName(fileName);
        String filePath = '${directory.path}/$sanitizedFileName';

        Dio dio = Dio();
        await dio.download(fileUrl, filePath);

        Get.snackbar('Berhasil', 'File berhasil diunduh ke: $filePath',
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.snackbar(
            'Gagal', 'Terjadi kesalahan saat mengunduh file: ${e.toString()}',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Gagal', 'Izin penyimpanan diperlukan untuk mengunduh file.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// Utility untuk Validasi Nama File
  String sanitizeFileName(String fileName) {
    return fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
  }

void searchSertifikasi(String query) {
    if (query.isEmpty) {
      filteredSertifikasi.assignAll(sertifikasis);
    } else {
      filteredSertifikasi.assignAll(sertifikasis.where((sertifikasi) {
        return sertifikasi.namaSertifikasi
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList());
    }
  }

  void filterPeriodeSertifikasi(String periode) {
    if (periode == "Semua") {
      filteredSertifikasi.assignAll(sertifikasis);
    } else {
      filteredSertifikasi.assignAll(sertifikasis.where((sertifikasi) {
        return sertifikasi.periode.tahunPeriode == periode;
      }).toList());
    }
  }
}
