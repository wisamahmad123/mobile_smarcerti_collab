import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/home_service.dart';

class HomeController extends BaseController {
  final HomeService _homeService = HomeService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  final error = Rx<String?>(null);
  final userData = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    update(); // Force UI update
  }

  Future<void> refreshData() async {
    try {
      error.value = null;
      await Future.wait([
        loadUserData(),
      ]);
    } catch (e) {
      print("Error refreshing data: $e");
      error.value = e.toString();
    }
  }

 Future<String?> getNamaLengkap() async {
  try {
    // Ambil data user dari API
    final user = await _apiProvider.getUserData();
    var nama;
    // Periksa apakah user data tidak null dan tipe sesuai
    if (user != null) {
      // Update namaLengkap pada userData (akses langsung namaLengkap)
      userData.value?.namaLengkap = nama; // Menugaskan objek User ke userData.user
    } else {
      print("User data is null or invalid");
    }
  } catch (e) {
    // Log error untuk debugging
    print("Error in getNamaLengkap: $e");
  }
}
 Future<int?> getLevel() async {
  try {
    // Ambil data user dari API
    final user = await _apiProvider.getUserData();
    var level;
    // Periksa apakah user data tidak null dan tipe sesuai
    if (user != null) {
      // Update namaLengkap pada userData (akses langsung namaLengkap)
      userData.value?.idLevel = level; // Menugaskan objek User ke userData.user
    } else {
      print("User data is null or invalid");
    }
  } catch (e) {
    // Log error untuk debugging
    print("Error in getNamaLengkap: $e");
  }
}



  Future<void> loadUserData() async {
    try {
      final user = await _apiProvider.getUserData();
      if (user != null) {
        userData.value = user;
        print(
            "data user profile ${userData.value!}  ${userData.value?.namaLengkap}");
      }
    } catch (e) {
      print("Error load user data: $e");
      error.value = e.toString();
    }
  }
}
