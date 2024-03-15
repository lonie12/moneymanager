import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/api/modules/wallet.dart';
import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/app/views/layout/wrapper.dart';

class WalletController extends GetxController {
  // Create new wallet
  void addWallet(WalletDto wallet) async {
    try {
      // Appel à (similation d'une api)
      var result = await WalletModule.addWallet(wallet);
      if (!result) {
        Fluttertoast.showToast(msg: "Wallet not added");
      } else {
        Fluttertoast.showToast(msg: "Wallet added");
        Get.offAll(AppWrapper());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
