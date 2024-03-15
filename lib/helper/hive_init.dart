import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:path_provider/path_provider.dart';

class HiveLocal {
  static init() async {
    // Initialisation
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    setAdapters();
    box = await Hive.openBox<List<Wallet>>('walletBox');
  }

  static late Box<List<Wallet>> box;

  static setAdapters() {
    Hive.registerAdapter(WalletAdapter());
  }

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
    await box.delete("walletItems");
    await box.putAll({"walletItems": wallets});
    return result;
  }

  // Get local saved wallets
  static List<Wallet> getWallets() {
    final wallets = box.get("walletItems");
    return wallets ?? <Wallet>[];
  }
}
