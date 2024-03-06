import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/api/modules/wallet.dart';
import 'package:moneymanager/app/models/wallet.dart';
import 'package:moneymanager/app/views/layout/wrapper.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/helper/utils.dart';

class WalletController extends GetxController {
  var accountname = "".obs; // Account name
  var accountid = "".obs; // Account ID
  var accounticon = appIcons[0]["value"].obs; // Account Icon
  var accountcolor = appColors[0]["value"].obs; // Color
  var accountdescription = "".obs; // Account Description
  var accounttype = (accountTypes[0]["value"] as String).obs; // Account type
  var accountcurrency = (appCurrencies[0]["value"]).obs; // Account currency
  var accountbalance = "0.0".obs; // Account balance
  var addtonetworth = false.obs;

  // Create new wallet
  void addWallet() async {
    try {
      // Validation des entrées (String)
      var stringsValid = stringFormValidation([
        accountid.value,
        accountname.value,
        accountcurrency.value.toString(),
      ]);

      // Validation des entrées de type double
      var doublesValid = doubleFormValidation([
        double.parse(accountbalance.value),
      ]);

      // Validation nécéssaire
      if (!stringsValid && !doublesValid) {
        Fluttertoast.showToast(msg: "Veuillez bien remplir les champs");
        return;
      }

      // Créer le modèle wallet
      var wallet = Wallet(
        id: Random().nextInt(100),
        value: accountid.value,
        name: accountname.value,
        balance: double.parse(accountbalance.value),
        currency: accountcurrency.value.toString(),
        description: accountdescription.value,
      );

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
