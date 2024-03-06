import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneymanager/helper/routes.dart';

class Loader extends StatefulWidget {
  const Loader({super.key, required this.call});

  final Function call;

  @override
  State<Loader> createState() => __LoaderStateState();
}

class __LoaderStateState extends State<Loader> {
  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        widget.call();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: Helper.exitwarning);
      return Future.value(false);
    }
    return Future.value(true);
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loader(
      call: () async {
        FlutterNativeSplash.remove();

        // Conditions d'entrées
        // if (true) {}

        // 
        return Get.offAllNamed(Routes.WRAPPER);
      },
    );
  }
}
