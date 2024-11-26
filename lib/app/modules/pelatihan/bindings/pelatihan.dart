import 'package:get/get.dart';
import 'package:mobile_smarcerti/services/pelatihan_api.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/controllers/pelatihan_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';

class PelatihanBinding  implements Bindings{

  @override
  void dependencies() {
  Get.lazyPut(() => ApiService());
  Get.lazyPut(() => PelatihanService(Get.find<ApiService>()));
  Get.lazyPut(() => PelatihanController());
  }
}
