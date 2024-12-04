import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
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
  Future<List<User>> getMyAccounts() async {
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
        final account = User.fromJson(accountData);
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

  Future<List<MataKuliahMyAccountModel>> getMataKuliah() async {
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
            .map<MataKuliahMyAccountModel>(
                (json) => MataKuliahMyAccountModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load mata kuliah');
      }
    } catch (e) {
      print('Error fetching mata kuliah: $e');
      throw Exception('Error fetching mata kuliah: $e');
    }
  }

  Future<List<BidangMinatMyAccountModel>> getBidangMinat() async {
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
            .map<BidangMinatMyAccountModel>(
                (json) => BidangMinatMyAccountModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load Bidang Minat');
      }
    } catch (e) {
      print('Error fetching Bidang Minat: $e');
      throw Exception('Error fetching Bidang Minat: $e');
    }
  }

  // Fungsi untuk mendapatkan data user yang akan diupdate
  Future<List<User>> getChangeProfiles() async {
    try {
      print("ChangeProfileService: Calling API...");
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
      print("Data User sebelum diedit: ${response.data}");

      if (response.data['success'] == true && response.data['data'] != null) {
        // Convert single object to list with one item
        final accountData = response.data['data'] as Map<String, dynamic>;
        final account = User.fromJson(accountData);
        return [account];
      } else {
        print("ChangeProfileService: No data in response");
        return [];
      }
    } catch (e) {
      print("ChangeProfileService Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final token = await getToken();
      if (token == null) throw Exception("Token not found");

      final response = await _dio.post(
        '${ApiConstants.baseUrl}my_accounts/update_password',
        data: {
          '_method': 'PUT',
          'old_password': oldPassword,
          'password': newPassword,
          'password_confirmation': confirmPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      // Print the entire response for debugging
      print("Full Response Data: ${response.data}");
      print("Response Status Code: ${response.statusCode}");

      // Handle different possible response structures
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Check for different possible success indicators
        final success = response.data['status'] == 'success' ||
            response.data['success'] == true;

        return {
          'success': success,
          'message': response.data['message'] ??
              response.data['msg'] ??
              'Password berhasil diubah',
        };
      } else {
        // Handle error responses
        return {
          'success': false,
          'message': response.data['message'] ??
              response.data['msg'] ??
              'Gagal mengubah password',
        };
      }
    } on DioException catch (e) {
      // More detailed Dio error handling
      print("Password Update DioError: ${e.response?.data}");
      print("Error Type: ${e.type}");
      print("Error Message: ${e.message}");

      // Check for specific error response
      if (e.response != null) {
        return {
          'success': false,
          'message': e.response?.data['message'] ??
              e.response?.data['msg'] ??
              'Kesalahan jaringan',
        };
      }

      return {
        'success': false,
        'message': 'Terjadi kesalahan jaringan',
      };
    } catch (e) {
      // Catch-all for unexpected errors
      print("Unexpected Password Update Error: $e");
      return {
        'success': false,
        'message': 'Terjadi kesalahan tidak terduga',
      };
    }
  }
}
