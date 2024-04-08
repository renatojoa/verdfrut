import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:greengroocer/src/config/splash_screen.dart';
import 'package:greengroocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengroocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengroocer/src/pages/base/base_screen.dart';
import 'package:greengroocer/src/pages/cart/cart_tab.dart';
import 'package:greengroocer/src/pages/profile/profile_tab.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PageRoutes.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PageRoutes.signInRoute, page: () => SignInScreen()),
    GetPage(name: PageRoutes.signUnRoute, page: () => const SignUpScreen()),
    GetPage(name: PageRoutes.profileRoute, page: () => const ProfileScreen()),
    GetPage(name: PageRoutes.baseRoute, page: () => const BaseScreen()),
  ];
}

abstract class PageRoutes {
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signIn';
  static const String signUnRoute = '/signUp';
  static const String profileRoute = '/profile';
  static const String baseRoute = '/';
}
