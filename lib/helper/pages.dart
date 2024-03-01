import 'package:get/get.dart';
import 'package:moneymanager/app/views/home/binding.dart';
import 'package:moneymanager/app/views/layout/loading.dart';
import 'package:moneymanager/app/views/layout/wrapper.dart';
import 'package:moneymanager/helper/routes.dart';

class Pages {
  static var list = [
    // GetPage(
    //   name: Routes.ONBOARD,
    //   page: () => const Scaffold(),
    // ),
    GetPage(
      name: Routes.LOADING,
      page: () => const Loading(),
    ),
    GetPage(
      name: Routes.WRAPPER,
      page: () => AppWrapper(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => AppWrapper(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.AUTH,
    //   page: () => const AuthIndex(),
    // ),
    // GetPage(
    //   name: Routes.SIGNIN,
    //   page: () => const SignIn(),
    // ),
    // GetPage(
    //   name: Routes.OTP,
    //   page: () => const Otp(),
    // ),
  ];
}
