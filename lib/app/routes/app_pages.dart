import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/middleware/auth_middleware.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_page.dart';
import 'package:mobile_smarcerti/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_pimpinan.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_form.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;  // Arahkan ke login sebagai default

  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => const LoginPage()),
    GetPage(name: Routes.LOGIN_FORM, page: () => const LoginForm()),
    GetPage(
      name: Routes.HOME,
      page: () => HomePimpinan(),
      binding: HomeBinding(),
      middlewares: [
        AuthMiddleware()
      ]
    ),
  ];
}

class Routes {
  static const LOGIN = '/login';
  static const LOGIN_FORM = '/loginForm';
  static const HOME = '/home'; // Arahkan ke home page jika login
}
                              