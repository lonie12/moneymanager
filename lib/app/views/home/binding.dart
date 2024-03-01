import 'package:get/get.dart';
import 'package:moneymanager/app/controllers/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
