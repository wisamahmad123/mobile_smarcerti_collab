import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/data/models/my_account_model.dart';
import 'package:mobile_smarcerti/app/data/provider/api_provider.dart';
import 'package:mobile_smarcerti/app/modules/auth/controllers/base_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/my_account_service.dart';

class MyAccountController extends BaseController {
  final MyAccountService _profileService = MyAccountService(ApiService());
  final ApiProvider _apiProvider = ApiProvider();
  RxList<MyAccount> myAccounts = <MyAccount>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
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
      print("Fetching my accounts data...");
      
      var data = await _profileService.getMyAccounts();
      print("Raw API Response: $data"); // Lihat data mentah dari API
      
      if (data != null && data.isNotEmpty) {
        print("Data received, length: ${data.length}");
        myAccounts.assignAll(data);
        print("MyAccounts after assignment: ${myAccounts.length}");
      } else {
        print("No data received from API");
        myAccounts.clear();
      }
    } catch (e) {
      print("Error in loadMyAccoutns: $e");
      print("Stack trace: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
