import 'package:moneymanager/models/dto/wallet.dto.dart';
import 'package:moneymanager/models/wallet.model.dart';
import 'package:moneymanager/services/wallet_methods.service.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'wallet_service.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class WalletService {
  factory WalletService(Dio dio, {String baseUrl}) = _WalletService;

  @GET("/wallets")
  Future<List<Wallet>> getWallets();

  // @POST("/wallets")
  // Future<bool> addWallet();
  // @POST("/wallets")
  static Future<bool> addWallet(WalletDto walletDto) async {
    return await WalletMethod.addWallet(walletDto);
  }
}
