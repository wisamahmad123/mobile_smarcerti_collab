import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/pelatihanUser.dart';
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
}
