import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/my_account_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeProfileService {
  final ApiService _apiService;

  ChangeProfileService(this._apiService);
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

  // Fungsi untuk mendapatkan data user yang akan diupdate
  Future<List<MyAccount>> getChangeProfiles() async {
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
        final account = MyAccount.fromJson(accountData);
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
// New methods to fetch all data
  // Future<List<MataKuliahMyAccountModel>> getAllMataKuliah() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('auth_token');

  //     final response = await _dio.get(
  //       '${ApiConstants.baseUrl}mataKuliahs', // Endpoint API
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );

  //     // Langsung casting karena data adalah List
  //     List<dynamic> data = response.data;
  //     return data
  //         .map((json) => MataKuliahMyAccountModel.fromJson(json))
  //         .toList();
  //   } catch (e) {
  //     print("Error fetching all Mata Kuliah: $e");
  //     rethrow;
  //   }
  // }

  // Future<List<BidangMinatMyAccountModel>> getAllBidangMinat() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('auth_token');

  //     final response = await _dio.get(
  //       '${ApiConstants.baseUrl}bidangMinats', // Adjust the endpoint
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );

  //     if (response.data['success'] == true) {
  //       List<dynamic> data = response.data['data'];
  //       return data
  //           .map((json) => BidangMinatMyAccountModel.fromJson(json))
  //           .toList();
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     print("Error fetching all Bidang Minat: $e");
  //     rethrow;
  //   }
  // }
}
