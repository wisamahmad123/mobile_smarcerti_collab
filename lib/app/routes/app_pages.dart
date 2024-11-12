import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/login_page.dart';
import 'package:mobile_smarcerti/widgets/login_form.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: '/navbar',
        page: () => PimpinanBottomNavBar(),
        binding: HomeBinding(),
        bindings: [
          ProfileBinding(),
          ChatBinding(),
          PharmacyBinding(),
          SubscriptionBinding(),
        ],
        middlewares: [
          AuthMiddleware()
        ]),
    GetPage(
        name: '/search', page: () => SearchPage(), binding: SearchBinding()),
   GetPage(
  name: '/product/alternative',
  
  page: () => AlternativeProductPage(),
  binding: AlternativeProductBinding(),
  
  transition: Transition.rightToLeft,
  
),
    GetPage(
        name: '/beranda',
        page: () => HomePage(),
        binding: HomeBinding(),
        bindings: [
          // SubscriptionBinding(), level
        ]),
  ];
}

class Routes {
  static const HOME = '/login';
}