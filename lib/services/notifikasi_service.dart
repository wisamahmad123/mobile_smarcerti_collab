import 'package:dio/dio.dart';
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
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifikasiService {
  final ApiService apiService;

  NotifikasiService(this.apiService);
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

  // Fungsi untuk mendapatkan data sertifikasi
  Future<List<Sertifikasi>> getSertifikasis() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}notifikasi_sertifikasis',
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
            .map<Sertifikasi>((json) => Sertifikasi.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load sertifikasis');
      }
    } catch (e) {
      print('Error fetching sertifikasis: $e');
      throw Exception('Error fetching sertifikasis: $e');
    }
  }

  Future<Sertifikasi> getSertifikasiById(int id) async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}sertifikasis/$id', // Menggunakan ID sertifikasi dalam URL
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Pastikan data yang diterima ada
        var json = response.data;
        if (json != null && json['data'] != null) {
          var parsed = json['data'];
          print("Parsed data: $parsed");

          // Mengembalikan objek Sertifikasi
          return Sertifikasi.fromJson(parsed);
        } else {
          throw Exception('Data sertifikasi tidak ditemukan');
        }
      } else {
        throw Exception(
            'Failed to load sertifikasi. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching sertifikasi by ID: $e');
      throw Exception('Error fetching sertifikasi by ID: $e');
    }
  }

  Future<List<VendorSertifikasi>> getVendorsertifikasi() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}vendorSertifikasi',
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
            .map<VendorSertifikasi>((json) => VendorSertifikasi.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load vendorsertifikasi');
      }
    } catch (e) {
      print('Error fetching sertifikasis: $e');
      throw Exception('Error fetching sertifikasis: $e');
    }
  }

  Future<List<BidangMinatSertifikasi>> getBidangMinat() async {
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
            .map<BidangMinatSertifikasi>(
                (json) => BidangMinatSertifikasi.fromJson(json))
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

  Future<List<MataKuliahSertifikasi>> getMataKuliah() async {
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
            .map<MataKuliahSertifikasi>(
                (json) => MataKuliahSertifikasi.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load mata kuliah');
      }
    } catch (e) {
      print('Error fetching mata kuliah: $e');
      throw Exception('Error fetching mata kuliah: $e');
    }
  }

  Future<List<JenisSertifikasi>> getJenisSertifikasi() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}jenisSertifikasi',
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
            .map<JenisSertifikasi>((json) => JenisSertifikasi.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load jenis sertifikasi');
      }
    } catch (e) {
      print('Error fetching jenis sertifikasi: $e');
      throw Exception('Error fetching jenis sertifikasi: $e');
    }
  }

  Future<List<PelatihanUser>> getPelatihans() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}notifikasi_pelatihans',
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
            .map<PelatihanUser>((json) => PelatihanUser.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load pelatihans');
      }
    } catch (e) {
      print('Error fetching pelatihan: $e');
      throw Exception('Error fetching pelatihans: $e');
    }
  }

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
        // Pastikan data yang diterima ada
        var json = response.data;
        if (json != null && json['data'] != null) {
          var parsed = json['data'];
          print("Parsed data: $parsed");

          // Mengembalikan objek pelatihan
          return PelatihanUser.fromJson(parsed);
        } else {
          throw Exception('Data pelatihan tidak ditemukan');
        }
      } else {
        throw Exception(
            'Failed to load pelatihan. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching pelatihan by ID: $e');
      throw Exception('Error fetching pelatihan by ID: $e');
    }
  }

  Future<List<VendorPelatihan>> getVendorPelatihan() async {
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
      throw Exception('Error fetching vendor pelatihans: $e');
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
        throw Exception('Failed to load jenis pelatihan');
      }
    } catch (e) {
      print('Error fetching jenis pelatihan: $e');
      throw Exception('Error fetching jenis pelatihan: $e');
    }
  }
}
