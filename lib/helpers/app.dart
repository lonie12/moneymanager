import "dart:io";

import "package:flutter/services.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:moneymanager/helpers/hive_init.dart";
import "package:moneymanager/helpers/localstorage.dart";
import "package:moneymanager/helpers/utils.dart";

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
    FlutterNativeSplash.remove();
    await HiveLocal.init();
    await LocalStorage.init(); // Localstorage
  }
}