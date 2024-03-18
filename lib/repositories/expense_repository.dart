import 'package:dio/dio.dart';
import 'package:moneymanager/helpers/expense.dart';
import 'package:moneymanager/models/category.model.dart';
import 'package:moneymanager/models/expense.model.dart';
import 'package:moneymanager/helpers/dio_provider.dart';
import 'package:moneymanager/helpers/localstorage.dart';
import 'package:moneymanager/services/expense.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_repository.g.dart';

class ExpenseRepository {
  ExpenseRepository({required this.client});

  final Dio client;

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

  // all wallets (local + remote)
  Future<List<Expense>?> getAllExpense() async {
    final ExpenseService expenseService = ExpenseService(client);
    final List<Expense> remotExpenses = await expenseService.getExpenses();
    return remotExpenses;
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
