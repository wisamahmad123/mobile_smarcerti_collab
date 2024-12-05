import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  final Dio _dio = Dio();
  static String? _accessToken;

  ApiProvider() {
    _dio.options.baseUrl = ApiConstants.baseUrl;

    // Tambahkan Interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) async {
        if (e.response?.statusCode == 401) {
          try {
            await refreshToken();
            final requestOptions = e.requestOptions;
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString('auth_token');
            requestOptions.headers['Authorization'] = 'Bearer $token';

            final response = await _dio.request(
              requestOptions.path,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
              ),
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );
            return handler.resolve(response);
          } catch (_) {
            await logout();
          }
        }
        return handler.next(e);
      },
    ));
  }
  Future<Response> login(String username, String password) async {
    try {
      final response = await _dio.post(ApiConstants.baseUrl + 'login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        print("response user data : ${data['user']}");
        await _saveTokens(
          accessToken: data['token'] ?? '',
          // refreshToken: data['refresh_token'] ?? '',
        );
        // await _saveTypes(type: data['user']['type'] ?? '');
        await saveUserData(data['user'] ?? {});

        return response;
      } else {
        print("Login failed with status code: ${response.statusCode}");
        return response;
      }
    } catch (e) {
      print("Login error: $e");
      throw e;
    }
  }

  Future<dynamic> refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refresh_token');

      if (refreshToken == null) {
        throw Exception('No refresh token found');
      }

      final response = await _dio.post('refresh-token',
          options: Options(
            headers: {
              'Authorization': 'Bearer $refreshToken',
              'Content-Type': 'application/json',
            },
          ));

      if (response.statusCode == 200) {
        final data = json.decode(response.data);
        await _saveTokens(
          accessToken: data['token'],
          refreshToken: data['token'],
        );
        return data['token'];
      } else {
        throw Exception('Failed to refresh token');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userData['user_id'].toString() ?? '');
    await prefs.setString('user_name', userData['username'] ?? '');
    await prefs.setString('user_email', userData['email'] ?? '');
    await prefs.setString('user_avatar', userData['avatar'] ?? '');
    await prefs.setString('id_level', userData['id_level'].toString() ?? '');
    await prefs.setString('nama_lengkap', userData['nama_lengkap'] ?? '');
    await prefs.setString(
        'user_data', json.encode(userData)); // Save complete user data
    print("Cek user data ${userData}");
    print("Cek user data yang disimpan: ${json.encode(userData)}");
  }

  Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');
    print("Cek user data di get user data ${userData}");
    if (userData != null) {
      return User.fromJson(json.decode(userData));
    }
    return null;
  }

  Future<String?> getLevelId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? type = preferences.getString('id_level');
    return type;
  }

  Future<void> _saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', accessToken);

    if (refreshToken != null) {
      await prefs.setString('refresh_token', refreshToken);
    }

    _accessToken = accessToken;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('refresh_token');
    await prefs.remove('type');
    await prefs.remove('conversation_key');

    _accessToken = null;
    Get.offAllNamed('/login');
  }

  // Method to update profile
  Future<User?> updateProfile(Map<String, dynamic> data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token == null) {
        throw Exception("Authentication token not found");
      }
      data['_method'] = 'PUT';

      // Create FormData for multipart request (to handle file upload)
      FormData formData = FormData.fromMap(data);

      // Send PUT request to update profile
      final response = await _dio.post(
        '${ApiConstants.baseUrl}my_accounts/update',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      // Periksa apakah respons berhasil
      if (response.statusCode == 200 && response.data != null) {
        // Parsing response menjadi model User
        return User.fromJson(response.data['user'] ?? response.data);
      }

      return null;
    } catch (e) {
      print("Error in updateProfile: $e");
      rethrow;
    }
  }
}
