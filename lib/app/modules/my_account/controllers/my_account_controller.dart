import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/bidang_minat_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/mata_kuliah_my_account_model.dart';
import 'package:mobile_smarcerti/app/data/models/user_model.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/my_account_service.dart';

class MyAccountController extends BaseController {
  final MyAccountService _myAccountService = MyAccountService(ApiService());
  RxList<User> myAccounts = <User>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  String? level;

  var mataKuliahList = <MataKuliahMyAccountModel>[].obs;
  var bidangMinatList = <BidangMinatMyAccountModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeData(); // Memuat data saat pertama kali diinisialisasi
  }

  @override
  void onReady() {
    super.onReady();
    initializeData(); // Memuat ulang data setiap kali halaman ditampilkan kembali
  }

  Future<void> initializeData() async {
    try {
      await loadMyAccoutns();
    } catch (e) {
      handleError(e);
    }
  }

  Future<void> loadMyAccoutns() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 5));
      print("Fetching my accounts data...");

      var data = await _myAccountService.getMyAccounts();
      print("Raw API Response: $data"); // Lihat data mentah dari API

      if (data != null && data.isNotEmpty) {
        myAccounts.assignAll(data);
      } else {
        myAccounts.clear();
      }

      level = data.first.idLevel;
      print("level myacc : $level");
    } catch (e) {
      print("Error in loadMyAccoutns: $e");
      print("Stack trace: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data bidang minat
  Future<void> loadBidangMinat() async {
    try {
      isLoading.value = true;
      var data = await _myAccountService.getBidangMinat();
      bidangMinatList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil bidang minat: $e");
      errorMessage.value = 'Gagal memuat data bidang minat.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Memuat data mata kuliah
  Future<void> loadMataKuliah() async {
    try {
      isLoading.value = true;
      var data = await _myAccountService.getMataKuliah();
      mataKuliahList.assignAll(data);
    } catch (e) {
      print("Error saat mengambil mata kuliah: $e");
      errorMessage.value = 'Gagal memuat data mata kuliah.';
    } finally {
      isLoading.value = false;
    }
  }
}
