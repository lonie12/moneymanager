import 'package:hive/hive.dart';
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
}
