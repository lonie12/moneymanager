import 'package:flutter/material.dart';
import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:moneymanager/helper/hive_init.dart';

class WalletPostMethod {
  // Create and save a new wallet
  static Future<bool> addWallet(WalletDto walletDto) async {
    var result = true;
    var wallets = getWallets();
    var findWallet = wallets.where(
      (e) => e.id == walletDto.id || e.name == walletDto.name,
    );
    if (findWallet.isNotEmpty) {
      debugPrint("Wallet already exists");
      result = false;
    } else {
      wallets.add(Wallet.fromObject(walletDto));
    }
    await HiveLocal.box.delete("walletItems");
    await HiveLocal.box.putAll({"walletItems": wallets});
    return result;
  }

  // Get local saved wallets
  static List<Wallet> getWallets() {
    final wallets = HiveLocal.box.get("walletItems");
    return wallets ?? <Wallet>[];
  }
}
