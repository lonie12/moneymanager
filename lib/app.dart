import "package:flutter/services.dart";
import "package:moneymanager/helper/localstorage.dart";

class App {
  App._();

  static initializeApp() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0XFFFFFFFF),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // await Firebaseapp.initialize();
    await LocalStorage.init();
  }
}
