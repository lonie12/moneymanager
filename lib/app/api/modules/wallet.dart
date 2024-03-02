import 'package:moneymanager/app/models/wallet.dart';
import 'package:moneymanager/helper/localstorage.dart';

class WalletModule {
  // add wallet api call method
  static Future<bool> addWallet(Wallet wallet) async {
    return await LocalStorage.addWallet(wallet);
  }

  // wallet list
  static Future<List<Wallet>> getWallets() async {
    return LocalStorage.getWallets();
  }
}
