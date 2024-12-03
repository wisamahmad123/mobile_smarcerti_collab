import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihan_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  final ApiService apiService;

  HomeService(this.apiService);

  final Dio _dio = Dio()
    ..options = BaseOptions(
      followRedirects: true,
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
    );

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('auth_token');
    return token;
  }

  Future<String?> getNamaLengkap() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? nama = preferences.getString('nama_lengkap');
    return nama;
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

  // Fungsi untuk mendapatkan data sertifikasi
  Future<List<Sertifikasi>> getSertifikasis() async {
    final token = await getToken();
    if (token == null) {
      print('Error: Token not found');
      throw Exception("Token not found");
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}sertifikasis',
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

  // Fungsi untuk mendapatkan data pelatihan dosen
  Future<List<Pelatihan>> getPelatihansDosen() async {
    final token = await getToken(); // Ambil token dari helper atau auth service
    if (token == null) throw Exception("Token not found");

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}pimpinanPelatihans',
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
        return parsed
            .map<Pelatihan>((json) => Pelatihan.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load pelatihans');
      }
    } catch (e) {
      throw Exception('Error fetching pelatihans: $e');
    }
  }

  // Fungsi untuk mendapatkan data sertifikasi dosen
  Future<List<Sertifikasi>> getSertifikasisDosen() async {
    final token = await getToken(); // Ambil token dari helper atau auth service
    if (token == null) throw Exception("Token not found");

    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}pimpinanSertifikasis',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Mengakses data yang berada dalam pelatihans -> data
        print(response.data);
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
  
}

