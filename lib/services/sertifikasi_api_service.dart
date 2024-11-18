import 'package:dio/dio.dart';

class SertifikasiApiService {
  final Dio _dio;

  SertifikasiApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://192.168.110.220:8000/api/sertifikasis/',
        ));

  Future<List<dynamic>> fetchSertifikasi() async {
    try {
      final response = await _dio.get('/');
      if (response.data['success']) {
        return response.data['data'];
      } else {
        throw Exception('Failed to load sertifikasi');
      }
    } catch (e) {
      throw Exception('Failed to load sertifikasi: $e');
    }
  }

  Future<Map<String, dynamic>> fetchDetailSertifikasi(int id) async {
    try {
      final response = await _dio.get('/$id');
      if (response.data['success']) {
        return response.data['data'];
      } else {
        throw Exception('Failed to load detail sertifikasi');
      }
    } catch (e) {
      throw Exception('Failed to load detail sertifikasi: $e');
    }
  }
}
