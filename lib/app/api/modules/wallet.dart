import 'package:moneymanager/app/api/api.dart';
import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:moneymanager/app/services/wallet_post_method.service.dart';
import 'package:moneymanager/helper/localstorage.dart';

final client = ApiClient();

class WalletModule {
  // add wallet api call method
  static Future<bool> addWallet(WalletDto walletDto) async {
    return await WalletPostMethod.addWallet(walletDto);
  }

  // wallet list
  static Future<List<Wallet>> getWallets() async {
    return LocalStorage.getWallets();
  }

  // all wallets (local + remeote)
  static dynamic allWallets() async {
    return client.get("wallets/");
  }
}
