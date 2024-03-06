import 'package:get/get.dart';
import 'package:moneymanager/app/views/home/binding.dart';
import 'package:moneymanager/app/views/layout/loading.dart';
import 'package:moneymanager/app/views/layout/wrapper.dart';
import 'package:moneymanager/helper/routes.dart';

// App pages
class Pages {
  static var list = [
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
  ];
}
