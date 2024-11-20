import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/auth_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UseAuth {
  final ApiProvider _apiService = ApiProvider();
  final userLevel = ''.obs;
  final HomeController userController = Get.put(HomeController());

  Future<void> _initIdLevel() async {
    try {
      final level = await _apiService.getLevelId();
      userLevel.value = level ?? '';
    } catch (e) {
      print("Error ${e}");
    }
  }

  Future<void> login(String username, String password) async {
    _initIdLevel();
    try {
      final response = await _apiService.login(username, password);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Login successful");
        print(userLevel);
        if (userLevel == "2") {
          Get.offAllNamed('/homeDosen');
        } else if (userLevel == "3") {
          Get.offAllNamed('/homePimpinan');
        }
        // Get.offAllNamed('/home'); // Navigate to the home page
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
