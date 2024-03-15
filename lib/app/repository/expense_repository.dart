import 'package:dio/dio.dart';
import 'package:moneymanager/app/api/modules/expense.dart';
import 'package:moneymanager/app/models/category.dart';
import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/app/models/expense.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:moneymanager/app/services/wallet_post_method.service.dart';
import 'package:moneymanager/app/services/wallet_service.dart';
import 'package:moneymanager/helper/dio_provider.dart';
import 'package:moneymanager/helper/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_repository.g.dart';

class ExpenseRepository {
  ExpenseRepository({required this.client});

  final Dio client;

  // all wallets (local + remote)
  Future<List<Wallet>?> allWallet() async {
    final WalletService walletService = WalletService(client);
    var localWallets = WalletPostMethod.getWallets();
    final List<WalletDto> walletDtos = await walletService.getWallets();
    if (walletDtos.isNotEmpty) {
      var remotWallets = Wallet.fromDataObject(walletDtos);
      return remotWallets + localWallets;
    }
    return null;
  }

  // all categories (local + remote)
  Future<List<Category>?> allCategory() async {
    // Local Data3
    var aCatgory = LocalStorage.getCategories();

    // Remote data
    var result = await ExpenseModule.allCategory();
    if (result.isNotEmpty) {
      var cts = List<Category>.from(result.map((value) {
        return Category.fromJson(value);
      })).toList();
      return aCatgory + cts;
    }
    return null;
  }

  // all expense (local + remote)
  Future<List<Expense>?> allExpense() async {
    // Local Data
    var aExpense = LocalStorage.getExpenses();
    // Remote data
    var result = await ExpenseModule.allExpense();
    if (result.isNotEmpty) {
      var eps = List<Expense>.from(result.map((value) {
        return Expense.fromJson(value);
      })).toList();
      return aExpense + eps;
    }
    return null;
  }

  // // Create new expense
  // void addExpense() async {
  //   try {
  //     // Validation nécéssaire
  //     if (wallet.value == null) {
  //       Fluttertoast.showToast(msg: "Veuillez sélectionner un Wallet");
  //       return;
  //     }
  //     // Validation nécéssaire
  //     if (category.value == null) {
  //       Fluttertoast.showToast(msg: "Veuillez sélectionner une catégorie");
  //       return;
  //     }

  //     // Créer le modèle wallet
  //     var expense = Expense(
  //       id: Random().nextInt(100),
  //       date: DateTime.now().millisecondsSinceEpoch.toString(),
  //       category: category.value!.id,
  //       wallet: wallet.value!.id,
  //       description: expenseDescription.value,
  //       amount: int.parse(expenseAmount.value),
  //     );

  //     // Appel à (similation d'une api)
  //     var result = await ExpenseModule.addExpense(expense);

  //     if (!result) {
  //       Fluttertoast.showToast(msg: "Expense not added");
  //     } else {
  //       Fluttertoast.showToast(msg: "Expense added");
  //       Get.back();
  //       await allExpense();
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // // Create new expense category
  // void addExpenseCategory() async {
  //   try {
  //     // Validation des entrées (String)
  //     var stringsValid = stringFormValidation([
  //       categoryname.value,
  //     ]);

  //     // Validation nécéssaire
  //     if (!stringsValid) {
  //       Fluttertoast.showToast(msg: "Veuillez bien remplir les champs");
  //       return;
  //     }

  //     // Créer le modèle wallet
  //     var category = Category(
  //       id: Random().nextInt(100),
  //       color: categorycolor.value,
  //       name: categoryname.value,
  //       currency: categorycurrency.value.toString(),
  //       description: categorydescription.value,
  //       type: categorytype.value,
  //     );

  //     // Appel à (similation d'une api)
  //     var result = await ExpenseModule.addExpenseCategory(category);

  //     if (!result) {
  //       Fluttertoast.showToast(msg: "Category not added");
  //     } else {
  //       Fluttertoast.showToast(msg: "Category added");
  //       Get.back();
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}

@riverpod
ExpenseRepository expenseRepository(ExpenseRepositoryRef ref) {
  return ExpenseRepository(client: ref.watch(dioProvider));
}
