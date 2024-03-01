import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var loading = false.obs;
  var appIsUpToDate = true.obs;
  var storeLink = "".obs;

  Rx<PageController> pageController = PageController().obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.value.jumpToPage(index);
    return update();
  }
}
