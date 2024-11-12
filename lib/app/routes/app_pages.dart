import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/middleware/auth_middleware.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_page.dart';
import 'package:mobile_smarcerti/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_pimpinan.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_form.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/loginForm', page: () => const LoginForm()),
    GetPage(
        name: '/home',
        page: () => HomePimpinan(),
        binding: HomeBinding(),
        middlewares: [
          AuthMiddleware()
        ]),

    // GetPage(
    //     name: '/beranda',
    //     page: () => HomePimpinan(),
    //     binding: HomeBinding()),
  ];
}

class Routes {
  static const HOME = '/login';
}