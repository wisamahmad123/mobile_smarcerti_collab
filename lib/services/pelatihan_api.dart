// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
// import 'package:mobile_smarcerti/app/utils/constant.dart';
// import 'package:mobile_smarcerti/services/api_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PelatihanService {
//   final ApiService apiService;

//   PelatihanService(this.apiService);

//   final Dio _dio = Dio()
//     ..options = BaseOptions(
//       validateStatus: (status) {
//         return status != null && status <= 500;
//       },
//       followRedirects: true,
//       receiveTimeout: const Duration(seconds: 15),
//       connectTimeout: const Duration(seconds: 15),
//     );


//   Future<String?> getToken() async {
//     try {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       String? token = preferences.getString('auth_token');
//       return token;
//     } catch (e) {
//       print('Error getting token: $e');
//       return null;
//     }
//   }

//   /// Fungsi untuk mendapatkan semua data pelatihan
//   Future<List<PelatihanUser>> getPelatihans() async {
//     final token = await getToken();
//     if (token == null) {
//       print('Error: Token not found');
//       throw Exception("Token not found");
//     }

//     try {
//       final response = await _dio.get(
//         '${ApiConstants.baseUrl}pelatihans',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         print(response.data);
//         var json = response.data;
//         final parsed = json['data'].cast<Map<String, dynamic>>();
//         print("Parsed data: $parsed");
//         return parsed
//             .map<PelatihanUser>((json) => PelatihanUser.fromJson(json))
//             .toList();
//       } else {
//         throw Exception('Failed to load pelatihans');
//       }
//     } catch (e) {
//       print('Error fetching pelatihans: $e');
//       throw Exception('Error fetching pelatihans: $e');
//     }
//   }

//   /// Fungsi untuk mendapatkan detail pelatihan berdasarkan ID
//   Future<PelatihanUser> getPelatihanById(int id) async {
//     final token = await getToken();
//     if (token == null) {
//       print('Error: Token not found');
//       throw Exception("Token not found");
//     }

//     try {
//       final response = await _dio.get(
//         '${ApiConstants.baseUrl}pelatihans/$id', // Menggunakan ID pelatihan dalam URL
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         var json = response.data;
//         if (json != null && json['data'] != null) {
//           var parsed = json['data'];
//           print("Parsed data: $parsed");

//           // Mengembalikan objek Pelatihan
//           return PelatihanUser.fromJson(parsed);
//         } else {
//           throw Exception('Data pelatihan tidak ditemukan');
//         }
//       } else {
//         throw Exception('Failed to load pelatihan. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching pelatihan by ID: $e');
//       throw Exception('Error fetching pelatihan by ID: $e');
//     }
//   }


//   /// Fungsi untuk menambah pelatihan baru
// Future<PelatihanUser?> addPelatihan(Map<String, dynamic> pelatihanData) async {
//   final token = await getToken();
//   if (token == null) {
//     print('Error: Token not found');
//     throw Exception("Token not found");
//   }

//   try {
//     final response = await _dio.post(
//       '${ApiConstants.baseUrl}pelatihans',
//       data: jsonEncode(pelatihanData), // Mengirim data dalam format JSON
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     if (response.statusCode == 201) {
//       print("Pelatihan berhasil ditambahkan: ${response.data}");
//       var json = response.data;
//       if (json != null && json['data'] != null) {
//         return PelatihanUser.fromJson(json['data']); // Mengembalikan objek pelatihan baru
//       } else {
//         throw Exception('Data pelatihan tidak valid');
//       }
//     } else {
//       throw Exception('Gagal menambahkan pelatihan. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error adding pelatihan: $e');
//     throw Exception('Error adding pelatihan: $e');
//   }
// }

// }

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/periode_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_pelatihan_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PelatihanService {
  final ApiService apiService;

  PelatihanService(this.apiService);

  final Dio _dio = Dio()
    ..options = BaseOptions(
      validateStatus: (status) {
        return status != null && status <= 500;
      },
      followRedirects: true,
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
    );


  Future<String?> getToken() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('auth_token');
      return token;
    } catch (e) {
      print('Error getting token: $e');
      return null;
    }
  }

  /// Fungsi untuk mendapatkan semua data pelatihan
  Future<List<PelatihanUser>> getPelatihans() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}pelatihans',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        var json = response.data;
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print("Parsed data: $parsed");
        return parsed
            .map<PelatihanUser>((json) => PelatihanUser.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load pelatihans');
      }
    } catch (e) {
      print('Error fetching pelatihans: $e');
      throw Exception('Error fetching pelatihans: $e');
    }
  }

  /// Fungsi untuk mendapatkan detail pelatihan berdasarkan ID
  Future<PelatihanUser> getPelatihanById(int id) async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}pelatihans/$id', // Menggunakan ID pelatihan dalam URL
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        var json = response.data;
        if (json != null && json['data'] != null) {
          var parsed = json['data'];
          print("Parsed data: $parsed");

          // Mengembalikan objek Pelatihan
          return PelatihanUser.fromJson(parsed);
        } else {
          throw Exception('Data pelatihan tidak ditemukan');
        }
      } else {
        throw Exception('Failed to load pelatihan. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching pelatihan by ID: $e');
      throw Exception('Error fetching pelatihan by ID: $e');
    }
  }


  /// Fungsi untuk menambah pelatihan baru
// Future<PelatihanUser?> addPelatihan(Map<String, dynamic> pelatihanData) async {
//   final token = await getToken();
//   if (token == null) {
//     print('Error: Token not found');
//     throw Exception("Token not found");
//   }

//   try {
//     final response = await _dio.post(
//       '${ApiConstants.baseUrl}pelatihans',
//       data: jsonEncode(pelatihanData), // Mengirim data dalam format JSON
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     if (response.statusCode == 201) {
//       print("Pelatihan berhasil ditambahkan: ${response.data}");
//       var json = response.data;
//       if (json != null && json['data'] != null) {
//         return PelatihanUser.fromJson(json['data']); // Mengembalikan objek pelatihan baru
//       } else {
//         throw Exception('Data pelatihan tidak valid');
//       }
//     } else {
//       throw Exception('Gagal menambahkan pelatihan. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error adding pelatihan: $e');
//     throw Exception('Error adding pelatihan: $e');
//   }
// }

//Fungsi untuk tambah pelatihan
  Future<PelatihanUser?> createPelatihan(Map<String, dynamic> data) async {
    final token = await getToken();
    if (token == null) {
      throw Exception("Token not found");
    }
    print(jsonEncode(data['id_bidang_minat']));

    FormData formData = FormData.fromMap({
      "_method": "POST",
      "nama_pelatihan": data['nama_pelatihan'],
      // "no_pelatihan": data['no_pelatihan'],
      "level_pelatihan": data['level_pelatihan'],
      "lokasi": data['lokasi'],
      "tanggal": data['tanggal'],
      "bukti_pelatihan":
          await MultipartFile.fromFile(data['bukti_pelatihan']),
      "masa_berlaku": data['masa_berlaku'],
      "kuota_peserta": data['kuota_peserta'],
      "biaya": data['biaya'],
      "id_vendor_pelatihan": int.parse(data['id_vendor_pelatihan']),
      "id_jenis_pelatihan": int.parse(data['id_jenis_pelatihan']),
      "id_periode": int.parse(data['id_periode']),
      "id_bidang_minat": data['id_bidang_minat'],
      "id_matakuliah": data['id_matakuliah'],
      "user_id": [data['user_id']],
    }, ListFormat.multiCompatible);

    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}pelatihans',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.data['success'] == true) {
        print('Response: ${response.data}');
        return PelatihanUser.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to create pelatihan: ${response.data}');
      }
    } catch (e) {
      print('Error creating pelatihan: $e');
      return null;
    }
  }

 Future<List<BidangMinatPelatihan>> getBidangMinat() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}bidangMinat',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Mengakses data yang berada dalam pelatihans -> data
        var json = response.data;
        print("json data : $json");
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print("parsed data : $parsed");
        return parsed
            .map<BidangMinatPelatihan>(
                (json) => BidangMinatPelatihan.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load Bidang Minat');
      }
    } catch (e) {
      print('Error fetching Bidang Minat: $e');
      throw Exception('Error fetching Bidang Minat: $e');
    }
  }

  Future<List<Periode>> getPeriode() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}periodes',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Mengakses data yang berada dalam pelatihans -> data
        var json = response.data;
        print("json data : $json");
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print("parsed data : $parsed");
        return parsed.map<Periode>((json) => Periode.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load periode');
      }
    } catch (e) {
      print('Error fetching periode: $e');
      throw Exception('Error fetching periode: $e');
    }
  }

 Future<List<VendorPelatihan>> getVendorpelatihan() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}vendorPelatihan',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Mengakses data yang berada dalam pelatihans -> data
        var json = response.data;
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print("parsed data : $parsed");
        return parsed
            .map<VendorPelatihan>((json) => VendorPelatihan.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load vendor pelatihan');
      }
    } catch (e) {
      print('Error fetching pelatihans: $e');
      throw Exception('Error fetching pelatihans: $e');
    }
  }


 Future<List<MataKuliahPelatihan>> getMataKuliah() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}mataKuliahs',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Mengakses data yang berada dalam pelatihans -> data
        var json = response.data;
        print("json data : $json");
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print("parsed data : $parsed");
        return parsed
            .map<MataKuliahPelatihan>(
                (json) => MataKuliahPelatihan.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load mata kuliah');
      }
    } catch (e) {
      print('Error fetching mata kuliah: $e');
      throw Exception('Error fetching mata kuliah: $e');
    }
  }

  Future<List<JenisPelatihan>> getJenisPelatihan() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}jenisPelatihan',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Mengakses data yang berada dalam pelatihans -> data
        var json = response.data;
        print("json data : $json");
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print("parsed data : $parsed");
        return parsed
            .map<JenisPelatihan>((json) => JenisPelatihan.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load jenis Pelatihan');
      }
    } catch (e) {
      print('Error fetching jenis Pelatihan: $e');
      throw Exception('Error fetching jenis Pelatihan: $e');
    }
  }
  

  //Update pelatihan
  Future<Pelatihan?> updatePelatihan(
      int id, Map<String, dynamic> data) async {
    final token = await getToken();
    if (token == null) {
      throw Exception("Token not found");
    }

    FormData formData = FormData.fromMap({
      "_method": "PUT",
      "id_vendor_pelatihan": data['id_vendor_pelatihan'],
      "id_jenis_pelatihan": data['id_jenis_pelatihan'],
      "id_periode": data['id_periode'],
      "id_bidang_minat": data['id_bidang_minat'],
      "id_matakuliah": data['id_matakuliah'],
      "user_id": data['user_id'],
      "nama_pelatihan": data['nama_pelatihan'],
      "level": data['level_pelatihan'],
      "bukti_pelatihan":
          await MultipartFile.fromFile(data['bukti_pelatihan']),
      "biaya": data['biaya'],
      "kuota_peserta": data['kuota_peserta'],
    });

    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}pelatihans/$id',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'multipart/form-data',
            // 'Accept': 'application/json',
          },
        ),
      );

      print('Response: ${response.data}');

      if (response.statusCode == 200 && response.data['success'] == true) {
        return Pelatihan.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to update pelatihan: ${response.data}');
      }
    } catch (e) {
      print('Error updating pelatihan: $e');
      return null;
    }
  }


}

