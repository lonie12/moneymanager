import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneymanager/app/models/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences storage;
  static init() async {
    storage = await SharedPreferences.getInstance();
  }

  static List<Wallet>? wallets;
  static bool get isdark => storage.getBool("isdark") ?? false;

  static Future<bool> addWallet(Wallet wallet) async {
    var aWallets = wallets = getWallets();
    if (wallets == []) {
      aWallets.add(wallet);
    } else {
      var findWallet = wallets!.where(
        (e) => e.id == wallet.id || e.name == wallet.name,
      );
      if (findWallet.isNotEmpty) {
        debugPrint("Wallet already exists");
      } else {
        aWallets.add(wallet);
      }
    }
    var encoded = json.encode(wallets);
    return await storage.setString("wallets", encoded);
  }

  static List<Wallet> getWallets() {
    var data = storage.getString("wallets") ?? "[]";
    var decode = json.decode(data);
    List<Wallet> allwallets = [];
    if (decode.isNotEmpty) {
      for (var element in decode) {
        allwallets.add(Wallet.fromJson(element));
      }
    }
    return wallets = allwallets;
  }
}
