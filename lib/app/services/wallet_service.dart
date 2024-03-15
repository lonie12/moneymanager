import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'wallet_service.g.dart';

@RestApi(baseUrl: Helper.apiUrl)
abstract class WalletService {
  factory WalletService(Dio dio, {String baseUrl}) = _WalletService;

  @GET("/wallets")
  Future<List<WalletDto>> getWallets();

  @POST("/wallets")
  Future<WalletDto> addWallet();
}
