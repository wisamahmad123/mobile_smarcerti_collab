import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UseAuth {
  final ApiProvider _apiService = ApiProvider();

  Future<void> login(String email, String password) async {
  try {
    final response = await _apiService.login(email, password);
    print("Response: $response");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Login successful");
      Get.offAllNamed('/home');  // Navigate to the home page
    } else {
      print("Login failed with status: ${response.statusCode}");
      Get.snackbar('Login Failed', 'Please check your credentials');
    }
  } catch (e) {
    print("Error during login: $e");
    Get.snackbar('Error', 'An error occurred during login');
  }
}

  Future<void> handleUnauthorized() async {
    try {
      await _apiService.refreshToken();
    } catch (e) {
      await logout();
    }
  }

  Future<void> logout() async {
    await _apiService.logout();
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final refreshToken = prefs.getString('refresh_token');
    return token != null && refreshToken != null;
  }
}