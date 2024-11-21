import 'package:dio/dio.dart';
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

  
}

