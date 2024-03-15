import "dart:io";

import "package:flutter/services.dart";
import "package:moneymanager/helper/hive_init.dart";
import "package:moneymanager/helper/localstorage.dart";
import "package:moneymanager/helper/utils.dart";

class App {
  App._();

  static initializeApp() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0XFFFFFFFF),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ); // System overlay (statusbar colors)
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    HttpOverrides.global = DevHttpOverrides(); // Dev dependency
    await HiveLocal.init();
    await LocalStorage.init(); // Localstorage
  }
}
