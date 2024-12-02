import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/notifikasi/controllers/list_notifikasi_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/notifikasi_service.dart';

class SertifikasiBinding  implements Bindings{

  @override
  void dependencies() {
  Get.lazyPut(() => ApiService());
  Get.lazyPut(() => NotifikasiService(Get.find<ApiService>()));
  Get.lazyPut(() => ListNotifikasiController());
  }
}