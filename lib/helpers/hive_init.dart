import 'package:hive/hive.dart';
import 'package:moneymanager/models/category.model.dart';
import 'package:moneymanager/models/wallet.model.dart';
import 'package:path_provider/path_provider.dart';

class HiveLocal {
  static init() async {
    // Initialisation
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    setAdapters();
    walletBox = await Hive.openBox<List<Wallet>>('walletBox');
    categoryBox = await Hive.openBox<List<Category>>('categoryBox');
  }

  static late Box<List<Wallet>> walletBox;
  static late Box<List<Category>> categoryBox;

  static setAdapters() {
    Hive.registerAdapter(WalletAdapter());
  }
}
