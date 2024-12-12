// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
// // import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
// // import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
// // import 'package:mobile_smarcerti/services/api_service.dart';
// // import 'package:mobile_smarcerti/services/pelatihan_api.dart';

// // class PelatihanController extends BaseController {
// //   final PelatihanService pelatihanService = PelatihanService(ApiService());
// //   final ApiProvider _apiProvider = ApiProvider();
// //   RxList<PelatihanUser> pelatihans = <PelatihanUser>[].obs; // Daftar pelatihan
// //   RxBool isLoading = false.obs; // Indikator loading
// //   RxString errorMessage = ''.obs; // Pesan error
// //   Rx<PelatihanUser?> pelatihanDetail = Rx<PelatihanUser?>(null); // Detail pelatihan

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     initializeData();
// //   }

// //   /// Inisialisasi data pelatihan
// //   Future<void> initializeData() async {
// //     try {
// //       await loadPelatihans();
// //     } catch (e) {
// //       handleError(e);
// //     }
// //   }

// //   /// Fungsi untuk mengambil daftar pelatihan
// //   Future<void> loadPelatihans() async {
// //     try {
// //       isLoading.value = true; // Menandakan loading dimulai
// //       var data = await pelatihanService.getPelatihans(); // Memanggil API
// //       if (data.isNotEmpty) {
// //         pelatihans.assignAll(data); // Masukkan data ke observable
// //       } else {
// //         pelatihans.clear(); // Hapus data lama jika tidak ada data baru
// //       }
// //     } catch (e) {
// //       print("Error saat mengambil pelatihan: $e");
// //       errorMessage.value = 'Gagal memuat data pelatihan: $e';
// //     } finally {
// //       isLoading.value = false; // Pastikan loading selesai
// //     }
// //   }

// //   /// Fungsi untuk memuat detail pelatihan berdasarkan ID
// //   Future<void> loadPelatihanById(int id) async {
// //     isLoading.value = true; // Menandakan loading dimulai
// //     try {
// //       // Memanggil fungsi API untuk mendapatkan detail pelatihan
// //       PelatihanUser pelatihan = await pelatihanService.getPelatihanById(id);
// //       pelatihanDetail.value = pelatihan; // Menyimpan detail pelatihan
// //     } catch (e) {
// //       // Jika terjadi error, reset nilai pelatihanDetail
// //       print('Error saat mengambil detail pelatihan: $e');
// //       pelatihanDetail.value = null;
// //       errorMessage.value = 'Gagal memuat detail pelatihan: $e';
// //     } finally {
// //       isLoading.value = false; // Menandakan loading selesai
// //     }
// //   }

// //     /// Fungsi untuk menambahkan pelatihan baru
// //   Future<void> addPelatihan(Map<String, dynamic> newPelatihanData) async {
// //     try {
// //       isLoading.value = true; // Menandakan proses dimulai
// //       var response = await pelatihanService.addPelatihan(newPelatihanData); // Panggil API untuk tambah pelatihan
// //       if (response != null) {
// //         pelatihans.add(response); // Tambahkan data baru ke daftar pelatihan
// //         Get.snackbar(
// //           "Berhasil",
// //           "Pelatihan baru berhasil ditambahkan",
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.green.withOpacity(0.7),
// //           colorText: Colors.white,
// //         );
// //       }
// //     } catch (e) {
// //       print('Error saat menambahkan pelatihan: $e');
// //       Get.snackbar(
// //         "Gagal",
// //         "Gagal menambahkan pelatihan: $e",
// //         snackPosition: SnackPosition.BOTTOM,
// //         backgroundColor: Colors.red.withOpacity(0.7),
// //         colorText: Colors.white,
// //       );
// //     } finally {
// //       isLoading.value = false; // Menandakan proses selesai
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_smarcerti/app/data/models/bidang_minat_pelatihan_model.dart';
// import 'package:mobile_smarcerti/app/data/models/jenis_pelatihan_model.dart';
// import 'package:mobile_smarcerti/app/data/models/mata_kuliah_pelatihan_model.dart';
// import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
// import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
// import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
// import 'package:mobile_smarcerti/app/data/models/vendor_pelatihan_model.dart';
// // import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
// import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
// import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
// import 'package:mobile_smarcerti/services/api_service.dart';
// import 'package:mobile_smarcerti/services/pelatihan_api.dart';
// import 'package:mobile_smarcerti/services/pdf_service.dart';

// import 'package:permission_handler/permission_handler.dart';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

// class PelatihanController extends BaseController {
//   final PelatihanService lspService = PelatihanService(ApiService());
//   final PdfService pdfService = PdfService();
//   final PelatihanService pelatihanService = PelatihanService(ApiService());
//   final ApiProvider _apiProvider = ApiProvider();

//   RxList<PelatihanUser> pelatihans = <PelatihanUser>[].obs; // Daftar pelatihan
//   RxBool isLoading = false.obs; // Indikator loading
//   RxString errorMessage = ''.obs; // Pesan error
//   Rx<PelatihanUser?> pelatihanDetail =
//       Rx<PelatihanUser?>(null); // Detail pelatihan

//   // List observables untuk vendor, bidang minat, dan mata kuliah
//   var vendorList = <VendorPelatihan>[].obs;
//   var bidangMinatList = <BidangMinatPelatihan>[].obs;
//   var mataKuliahList = <MataKuliahPelatihan>[].obs;
//   var jenisPelatihanList = <JenisPelatihan>[].obs;
//   var tahunPeriode = <Periode>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     initializeData();
//   }

//   /// Inisialisasi data pelatihan
//   // Future<void> initializeData() async {
//   //   try {
//   //     await loadPelatihans();

//   //   } catch (e) {
//   //     handleError(e);
//   //   }
//   // }

//   Future<void> initializeData() async {
//     await Future.wait([
//       loadPelatihans(),
//       loadVendors(),
//       loadBidangMinat(),
//       loadMataKuliah(),
//       loadPeriode(),
//     ]);
//   }

//   // Fungsi untuk refresh data
//   Future<void> onRefreshPelatihans() async {
//     await loadPelatihans(); // Panggil fungsi untuk ambil ulang data pelatihan
//   }

//   /// Fungsi untuk mengambil daftar pelatihan
//   Future<void> loadPelatihans() async {
//     try {
//       isLoading.value = true; // Menandakan loading dimulai
//       var data = await pelatihanService.getPelatihans(); // Memanggil API
//       if (data.isNotEmpty) {
//         pelatihans.assignAll(data); // Masukkan data ke observable
//       } else {
//         pelatihans.clear(); // Hapus data lama jika tidak ada data baru
//       }
//     } catch (e) {
//       print("Error saat mengambil pelatihan: $e");
//       errorMessage.value = 'Gagal memuat data pelatihan: $e';
//     } finally {
//       isLoading.value = false; // Pastikan loading selesai
//     }
//   }

//   /// Fungsi untuk memuat detail pelatihan berdasarkan ID
//   Future<void> loadPelatihanById(int id) async {
//     isLoading.value = true; // Menandakan loading dimulai
//     try {
//       // Memanggil fungsi API untuk mendapatkan detail pelatihan
//       PelatihanUser pelatihan = await pelatihanService.getPelatihanById(id);
//       pelatihanDetail.value = pelatihan; // Menyimpan detail pelatihan
//     } catch (e) {
//       // Jika terjadi error, reset nilai pelatihanDetail
//       print('Error saat mengambil detail pelatihan: $e');
//       pelatihanDetail.value = null;
//       errorMessage.value = 'Gagal memuat detail pelatihan: $e';
//     } finally {
//       isLoading.value = false; // Menandakan loading selesai
//     }
//   }

//   //   /// Fungsi untuk menambahkan pelatihan baru
//   // Future<void> addPelatihan(Map<String, dynamic> newPelatihanData) async {
//   //   try {
//   //     isLoading.value = true; // Menandakan proses dimulai
//   //     var response = await pelatihanService.addPelatihan(newPelatihanData); // Panggil API untuk tambah pelatihan
//   //     if (response != null) {
//   //       pelatihans.add(response); // Tambahkan data baru ke daftar pelatihan
//   //       Get.snackbar(
//   //         "Berhasil",
//   //         "Pelatihan baru berhasil ditambahkan",
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.green.withOpacity(0.7),
//   //         colorText: Colors.white,
//   //       );
//   //     }
//   //   } catch (e) {
//   //     print('Error saat menambahkan pelatihan: $e');
//   //     Get.snackbar(
//   //       "Gagal",
//   //       "Gagal menambahkan pelatihan: $e",
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       backgroundColor: Colors.red.withOpacity(0.7),
//   //       colorText: Colors.white,
//   //     );
//   //   } finally {
//   //     isLoading.value = false; // Menandakan proses selesai
//   //   }
//   // }



//   /// Mengupdate sertifikasi
//   Future<void> updatePelatihan(int id, Map<String, dynamic> data) async {
//     isLoading.value = true;
//     try {
//       final Pelatihan? result = await lspService.updatePelatihan(id, data);
//       if (result != null) {
//         Get.snackbar(
//           'Berhasil',
//           'Pelatihan berhasil diperbarui.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         errorMessage.value = 'Gagal memperbarui Pelatihan.';
//         Get.snackbar(
//           'Gagal',
//           errorMessage.value,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       errorMessage.value = 'Gagal memperbarui Pelatihan: $e';
//       Get.snackbar(
//         'Gagal',
//         errorMessage.value,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Unduh file PDF
//   Future<void> downloadPdf(String fileName, String fileUrl) async {
//     PermissionStatus permissionStatus = await Permission.storage.request();
//     if (permissionStatus.isGranted) {
//       try {
//         Directory? directory = await getExternalStorageDirectory();
//         directory ??= await getApplicationDocumentsDirectory();

//         String sanitizedFileName = sanitizeFileName(fileName);
//         String filePath = '${directory.path}/$sanitizedFileName';

//         Dio dio = Dio();
//         await dio.download(fileUrl, filePath);

//         Get.snackbar('Berhasil', 'File berhasil diunduh ke: $filePath',
//             snackPosition: SnackPosition.BOTTOM);
//       } catch (e) {
//         Get.snackbar(
//             'Gagal', 'Terjadi kesalahan saat mengunduh file: ${e.toString()}',
//             snackPosition: SnackPosition.BOTTOM);
//       }
//     } else {
//       Get.snackbar('Gagal', 'Izin penyimpanan diperlukan untuk mengunduh file.',
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   /// Utility untuk Validasi Nama File
//   String sanitizeFileName(String fileName) {
//     return fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
//   }

//   Future<void> createPelatihan(Map<String, dynamic> data) async {
//     isLoading.value = true;

//     try {
//       final PelatihanUser? result = await lspService.createPelatihan(data);
//       if (result != null) {
//         pelatihans.add(result); // Tambahkan pelatihan baru ke daftar
//         Get.snackbar(
//           'Berhasil',
//           'Pelatihan berhasil ditambahkan.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         errorMessage.value = 'Gagal membuat pelatihan.';
//         Get.snackbar(
//           'Gagal',
//           errorMessage.value,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       errorMessage.value = 'Gagal membuat pelatihan: $e';
//       Get.snackbar(
//         'Gagal',
//         errorMessage.value,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Memuat data vendor
//   Future<void> loadVendors() async {
//     try {
//       isLoading.value = true;
//       var data = await lspService.getVendorpelatihan();
//       vendorList.assignAll(data); // Perbaiki untuk mengisi ke vendorList
//     } catch (e) {
//       print("Error saat mengambil vendor pelatihan: $e");
//       errorMessage.value = 'Gagal memuat data vendor pelatihan.';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Memuat data bidang minat
//   Future<void> loadBidangMinat() async {
//     try {
//       isLoading.value = true;
//       var data = await lspService.getBidangMinat();
//       bidangMinatList.assignAll(data);
//     } catch (e) {
//       print("Error saat mengambil bidang minat: $e");
//       errorMessage.value = 'Gagal memuat data bidang minat.';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Memuat data periode
//   Future<void> loadPeriode() async {
//     try {
//       isLoading.value = true;
//       var data = await lspService.getPeriode();
//       tahunPeriode.assignAll(data);
//     } catch (e) {
//       print("Error saat mengambil periode: $e");
//       errorMessage.value = 'Gagal memuat data periode.';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Memuat data mata kuliah
//   Future<void> loadMataKuliah() async {
//     try {
//       isLoading.value = true;
//       var data = await lspService.getMataKuliah();
//       mataKuliahList.assignAll(data);
//     } catch (e) {
//       print("Error saat mengambil mata kuliah: $e");
//       errorMessage.value = 'Gagal memuat data mata kuliah.';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> loadJenisPelatihan() async {
//     try {
//       isLoading.value = true;
//       var data = await lspService.getJenisPelatihan();
//       jenisPelatihanList.assignAll(data);
//     } catch (e) {
//       print("Error saat mengambil jenis Pelatihan: $e");
//       errorMessage.value = 'Gagal memuat data jenis Pelatihan.';
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';
import 'package:mobile_smarcerti/services/pelatihan_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PelatihanController extends BaseController {
  final PelatihanService lspService = PelatihanService(ApiService());
  final PdfService pdfService = PdfService();

  // Observable untuk daftar Pelatihan dan detail Pelatihan
  RxList<PelatihanUser> pelatihans = <PelatihanUser>[].obs;
  Rx<PelatihanUser?> pelatihanDetail = Rx<PelatihanUser?>(null);
   RxList<PelatihanUser> filteredPelatihan = <PelatihanUser>[].obs; // 

  // List observables untuk vendor, bidang minat, dan mata kuliah
  var vendorList = <VendorPelatihan>[].obs;
  var bidangMinatList = <BidangMinatPelatihan>[].obs;
  var mataKuliahList = <MataKuliahPelatihan>[].obs;
  var jenisPelatihanList = <JenisPelatihan>[].obs;

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
      loadPelatihans(),
      loadVendors(),
      loadBidangMinat(),
      loadMataKuliah(),
      loadPeriode(),
    ]);
  }

    // Fungsi untuk refresh data
  Future<void> onRefreshSertifikasis() async {
      await loadPelatihans(); // Panggil fungsi untuk ambil ulang data pelatihan
  }

  /// Memuat daftar sertifikasi
  Future<void> loadPelatihans() async {
    try {
      isLoading.value = true;
      var data = await lspService.getPelatihans();
      pelatihans.assignAll(data);
    } catch (e) {
      print("Error saat mengambil Pelatihan: $e");
      errorMessage.value = 'Gagal memuat data Pelatihan.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat detail Pelatihan berdasarkan ID
  Future<void> loadPelatihanById(int id) async {
    try {
      isLoading.value = true;
      PelatihanUser pelatihan = await lspService.getPelatihanById(id);
      pelatihanDetail.value = pelatihan;
    } catch (e) {
      print("Error: $e");
      errorMessage.value = 'Gagal memuat detail Pelatihan.';
      pelatihanDetail.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data vendor

  /// Memuat data vendor
  Future<void> loadVendors() async {
    try {
      isLoading.value = true;
      var data = await lspService.getVendorpelatihan();
      vendorList.assignAll(data); // Perbaiki untuk mengisi ke vendorList
    } catch (e) {
      print("Error saat mengambil vendor pelatihan: $e");
      errorMessage.value = 'Gagal memuat data vendor pelatihan.';
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
  Future<void> loadJenisPelatihan() async {
    try {
      isLoading.value = true;
      var data = await lspService.getJenisPelatihan();
      jenisPelatihanList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil jenis Pelatihan: $e");
      errorMessage.value = 'Gagal memuat data jenis Pelatihan.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Menambahkan Pelatihan baru
  Future<void> createPelatihan(Map<String, dynamic> data) async {
    isLoading.value = true;

    try {
      final PelatihanUser? result = await lspService.createPelatihan(data);
      if (result != null) {
        pelatihans.add(result); // Tambahkan Pelatihan baru ke daftar
        Get.snackbar(
          'Berhasil',
          'Pelatihan berhasil ditambahkan.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        errorMessage.value = 'Gagal membuat Pelatihan.';
        Get.snackbar(
          'Gagal',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = 'Gagal membuat Pelatihan: $e';
      Get.snackbar(
        'Gagal',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Mengupdate Pelatihan
  Future<void> updatePelatihan(int id, Map<String, dynamic> data) async {
    isLoading.value = true;
    try {
      final PelatihanUser? result = await lspService.updatePelatihan(id, data);
      if (result != null) {
        Get.snackbar(
          'Berhasil',
          'Pelatihan berhasil diperbarui.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        errorMessage.value = 'Gagal memperbarui Pelatihan.';
        Get.snackbar(
          'Gagal',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = 'Gagal memperbarui Pelatihan: $e';
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

void searchPelatihan(String query) {
    if (query.isEmpty) {
      filteredPelatihan.assignAll(pelatihans);
    } else {
      filteredPelatihan.assignAll(pelatihans.where((pelatihan) {
        return pelatihan.namaPelatihan
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList());
    }
  }

  void filterPeriodePelatihan(String periode) {
    if (periode == "Semua") {
      filteredPelatihan.assignAll(pelatihans);
    } else {
      filteredPelatihan.assignAll(pelatihans.where((pelatihan) {
        return pelatihan.periode.tahunPeriode == periode;
      }).toList());
    }
  }
}
