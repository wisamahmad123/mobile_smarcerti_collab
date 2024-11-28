import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/controllers/list_pelatihan_controller.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/controller/req_acc_controller.dart';
import 'package:mobile_smarcerti/services/api_service.dart';
import 'package:mobile_smarcerti/services/home_service.dart';
import 'package:mobile_smarcerti/services/list_pelatihan_sertifikasi_service.dart';
import 'package:mobile_smarcerti/services/req_acc_service.dart';

class ReqaccBinding  implements Bindings{

  @override
  void dependencies() {
  Get.lazyPut(() => ApiService());
  Get.lazyPut(() => ReqAccService(Get.find<ApiService>()));
  Get.lazyPut(() => ReqAccController());
  }
}