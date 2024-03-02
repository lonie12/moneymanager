import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/api/modules/wallet.dart';
import 'package:moneymanager/app/models/wallet.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/helper/utils.dart';

class WalletController extends GetxController {
  var accountname = "".obs;
  var accountid = "".obs;
  var accounticon = Helper.appIcons[0]["value"].obs;
  var accountcolor = Helper.appColors[0]["value"].obs;
  var accountdescription = "".obs;
  var accounttype = (Helper.accountTypes[0]["value"] as String).obs;
  var accountcurrency = (Helper.appCurrencies[0]["value"] as String).obs;
  var accountbalance = "0.0".obs;
  var addtonetworth = false.obs;

  void addWallet() async {
    try {
      // Validation des entrées (String)
      var stringsValid = stringFormValidation([
        accountid.value,
        accountname.value,
        accountcurrency.value,
      ]);

      var doublesValid = doubleFormValidation([
        double.parse(accountbalance.value),
      ]);

      if (!stringsValid && doublesValid) {
        Fluttertoast.showToast(msg: "Veuillez bien remplir les champs");
        return;
      }

      var wallet = Wallet(
        id: Random().nextInt(100),
        value: accountid.value,
        name: accountname.value,
        balance: 100,
        currency: accountcurrency.value,
        description: accountdescription.value,
      );

      var result = await WalletModule.addWallet(wallet);
      if (!result) {
        Fluttertoast.showToast(msg: "Wallet not added");
      } else {
        Fluttertoast.showToast(msg: "Wallet added");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
