import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/controllers/sertifikasi_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/home_service.dart';
import 'package:mobile_smarcerti/services/sertifikasi_service.dart';

class SertifikasiBinding  implements Bindings{

  @override
  void dependencies() {
  Get.lazyPut(() => ApiService());
  Get.lazyPut(() => SertifikasiService(Get.find<ApiService>()));
  Get.lazyPut(() => SertifikasiController());
  }
}