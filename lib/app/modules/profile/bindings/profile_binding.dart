import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/profile/controllers/profile_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/my_account_service.dart';

class ProfileBinding  implements Bindings{

  @override
  void dependencies() {
  Get.lazyPut(() => ApiService());
  Get.lazyPut(() => MyAccountService(Get.find<ApiService>()));
  Get.lazyPut(() => ProfileController());
  }
}