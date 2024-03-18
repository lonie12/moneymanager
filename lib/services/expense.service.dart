import 'package:moneymanager/models/dto/wallet.dto.dart';
import 'package:moneymanager/models/expense.model.dart';
import 'package:moneymanager/services/wallet_methods.service.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'expense.service.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ExpenseService {
  factory ExpenseService(Dio dio, {String baseUrl}) = _ExpenseService;

  @GET("/expense")
  Future<List<Expense>> getExpenses();

  // @POST("/expenses")
  static Future<bool> addWallet(WalletDto walletDto) async {
    return await WalletMethod.addWallet(walletDto);
  }
}
