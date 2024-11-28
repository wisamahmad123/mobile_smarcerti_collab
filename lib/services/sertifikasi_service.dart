import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/jenis_sertfikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/data/models/vendor_sertifikasi_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SertifikasiService {
  final ApiService apiService;

  SertifikasiService(this.apiService);
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

  Future<Sertifikasi> getSertifikasiById(int id) async {
  final token = await getToken();
  if (token == null) {
    print('Error: Token not found');
    throw Exception("Token not found");
  }

  try {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}sertifikasis/$id',  // Menggunakan ID sertifikasi dalam URL
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
      throw Exception('Failed to load sertifikasi. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching sertifikasi by ID: $e');
    throw Exception('Error fetching sertifikasi by ID: $e');
  }
}

Future<List<VendorSertifikasi>> getVendorsertifikasi() async {
  final response = await fetchData('vendors'); // Endpoint API vendor
  return response.map((e) => VendorSertifikasi.fromJson(e)).toList();
}

Future<List<BidangMinatSertifikasi>> getBidangMinat() async {
  final response = await fetchData('bidangMinats'); // Endpoint API bidang minat
  return response.map((e) => BidangMinatSertifikasi.fromJson(e)).toList();
}

Future<List<MataKuliahSertifikasi>> getMataKuliah() async {
  final response = await fetchData('mataKuliahs'); // Endpoint API mata kuliah
  return response.map((e) => MataKuliahSertifikasi.fromJson(e)).toList();
}

Future<List<JenisSertifikasi>> getJenisSertifikasi() async{
  final response = await fetchData('jenissertifikasi');
   return response.map((e) => JenisSertifikasi.fromJson(e)).toList();
}


//Fungsi untuk tambah sertifikasi
Future<Sertifikasi?> createSertifikasi(Map<String, dynamic> data) async {
  final token = await getToken();
  if (token == null) {
    throw Exception("Token not found");
  }

  try {
    final response = await _dio.post(
      'sertifikasis',
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      return Sertifikasi.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to create sertifikasi: ${response.data}');
    }
  } catch (e) {
    print('Error creating sertifikasi: $e');
    return null;
  }
}

  Future<List<Map<String, dynamic>>> fetchData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['data']);
      } else {
        throw Exception('Failed to load $endpoint data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioError) {
        print('Dio Error: ${e.message}');
      } else {
        print('Unexpected Error: $e');
      }
      throw Exception('Error fetching $endpoint: $e');
    }
  }

 




}
