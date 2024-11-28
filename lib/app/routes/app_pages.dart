import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/middleware/auth_middleware.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_page.dart';
import 'package:mobile_smarcerti/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_dosen.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_pimpinan.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_form.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/bindings/listpelatihansertifikasi_binding.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/list_daftar_pelatihan_sertifikasi_page.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/bindings/reqAcc_binding.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/request_acc_page.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;  // Arahkan ke login sebagai default

  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => const LoginPage()),
    GetPage(name: Routes.LOGIN_FORM, page: () => const LoginForm()),
    GetPage(
      name: Routes.HOME,
      page: () => HomePimpinan(),
      binding: HomeBinding(),
      bindings: [
        ListpelatihansertifikasiBinding()
      ],
      middlewares: [
        AuthMiddleware()
      ]
    ),
    GetPage(
      name: Routes.HOMEPIMPINAN,
      page: () => HomePimpinan(),
      binding: HomeBinding(),
      bindings: [
        ListpelatihansertifikasiBinding(),
        ReqaccBinding(),
      ],
      middlewares: [
        AuthMiddleware()
      ]
    ),
    GetPage(
      name: Routes.HOMEDOSEN,
      page: () => HomeDosen(),
      binding: HomeBinding(),
      middlewares: [
        AuthMiddleware()
      ]
    ),
    GetPage(name: Routes.LISTPS, page: () => const ListDaftarPelatihanSertifikasiPage()),
    GetPage(name: Routes.REQACC, page: () => const RequestPimpinan()),
  ];
}

class Routes {
  static const LOGIN = '/login';
  static const LOGIN_FORM = '/loginForm';
  static const HOMEPIMPINAN = '/homePimpinan'; // Arahkan ke home pimpinan jika login
  static const HOMEDOSEN = '/homeDosen'; // Arahkan ke home dosen jika login
  static const HOME = '/home'; // Arahkan ke home dosen jika login
  static const LISTPS = '/listPS'; // Arahkan ke home dosen jika login
  static const REQACC = '/reqACC'; // Arahkan ke home dosen jika login
}
                              