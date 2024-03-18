import 'package:flutter/material.dart';
import 'package:moneymanager/models/dto/wallet.dto.dart';
import 'package:moneymanager/models/wallet.model.dart';
import 'package:moneymanager/helpers/hive_init.dart';

class WalletMethod {
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
    await HiveLocal.walletBox.delete("walletItems");
    await HiveLocal.walletBox.putAll({"walletItems": wallets});
    return result;
  }

  // Get local saved wallets
  static List<Wallet> getWallets() {
    final wallets = HiveLocal.walletBox.get("walletItems");
    return wallets ?? <Wallet>[];
  }
}
