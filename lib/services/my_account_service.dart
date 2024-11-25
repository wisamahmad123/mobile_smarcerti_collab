import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/my_account_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountService {
  final ApiService _apiService;

  MyAccountService(this._apiService);
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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('auth_token');
    return token;
  }

  // Fungsi untuk mendapatkan data pelatihan
  Future<List<MyAccount>> getMyAccounts() async {
    try {
      print("MyAccountService: Calling API...");
      final token =
          await getToken(); // Ambil token dari helper atau auth service
      if (token == null) throw Exception("Token not found");

      final response = await _dio.get(
        '${ApiConstants.baseUrl}my_accounts',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      print("MyAccountService: Raw API Response: ${response.data}");

      if (response.data['success'] == true && response.data['data'] != null) {
        // Convert single object to list with one item
        final accountData = response.data['data'] as Map<String, dynamic>;
        final account = MyAccount.fromJson(accountData);
        return [account];
      } else {
        print("MyAccountService: No data in response");
        return [];
      }
    } catch (e) {
      print("MyAccountService Error: $e");
      rethrow;
    }
  }
}
