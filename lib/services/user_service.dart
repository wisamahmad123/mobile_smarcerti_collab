import 'package:dio/dio.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final Dio _dio = Dio();
  final ApiProvider _apiProvider = ApiProvider();
  Future<User> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    if (token == null || token.isEmpty) {
      throw Exception('No authentication token found');
    } else {
      print(" token $token");
    }

    final response = await _dio.get(
      '${ApiConstants.baseUrl}me',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    print("responset d di user service ${response.data}");

    if (response.statusCode == 200) {
      print("res di user service ${response.data}");
      await _apiProvider.saveUserData(response.data['user'] ?? {});
      return User.fromJson(response.data);
    } else if (response.statusCode == 500) {
      print("res di user service ${response.data}");
      throw Exception('Failed to fetch user profile');
    } else {
      print("res di user service ${response.data}");
      throw Exception('Failed to fetch user profile');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    // await prefs.remove('type');
  }
}
