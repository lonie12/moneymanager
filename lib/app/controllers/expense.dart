import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/api/modules/expense.dart';
import 'package:moneymanager/app/api/modules/wallet.dart';
import 'package:moneymanager/app/models/category.dart';
import 'package:moneymanager/app/models/expense.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/helper/localstorage.dart';
import 'package:moneymanager/helper/utils.dart';

class ExpenseController extends GetxController {
  // Expense category
  var categoryname = "".obs; // Category name
  var categorycolor = (appColors[0]["value"] as String).obs; // Color
  var categorydescription = "".obs; // Category Description
  var categorytype = (categoryTypes[0]["value"] as String).obs; // Category type
  var categorycurrency = (appCurrencies[0]["value"]).obs; // Category currency

  // Expense
  var expenseAmount = "0".obs;
  var expenseDescription = "".obs;

  var amountController = TextEditingController(text: "0.0").obs;
  var loading = false.obs;

  // Selected wallet || category
  Rxn<Wallet> wallet = Rxn<Wallet>();
  Rxn<Category> category = Rxn<Category>();

  // Wallet et Category Lists
  Rxn<List<Wallet>> wallets = Rxn<List<Wallet>>();
  Rxn<List<Category>> categories = Rxn<List<Category>>();
  Rxn<List<Expense>> expenses = Rxn<List<Expense>>();

  // all wallets (local + remote)
  Future<List<Wallet>?> allWallets() async {
    // Local Data
    var aWallets = LocalStorage.getWallets();

    // Remote data
    var result = await WalletModule.allWallets();
    if (result.isNotEmpty) {
      var wts = List<Wallet>.from(result.map((value) {
        return Wallet.fromJson(value);
      })).toList();
      wallet.value = wts.first;
      return wallets.value = aWallets + wts;
    }
    return null;
  }

  // all categories (local + remote)
  Future<List<Category>?> allCategory() async {
    // Local Data
    var aCatgory = LocalStorage.getCategories();

    // Remote data
    var result = await ExpenseModule.allCategory();
    if (result.isNotEmpty) {
      var cts = List<Category>.from(result.map((value) {
        return Category.fromJson(value);
      })).toList();
      category.value = cts.first;
      return categories.value = aCatgory + cts;
    }
    return null;
  }

  // all expense (local + remote)
  Future<List<Expense>?> allExpense() async {
    loading(true);
    // Local Data
    var aExpense = LocalStorage.getExpenses();
    // Remote data
    var result = await ExpenseModule.allExpense();
    if (result.isNotEmpty) {
      var eps = List<Expense>.from(result.map((value) {
        return Expense.fromJson(value);
      })).toList();
      loading(false);
      return expenses.value = aExpense + eps;
    }
    loading(false);
    return null;
  }

  // Create new expense
  void addExpense() async {
    try {
      // Validation nécéssaire
      if (wallet.value == null) {
        Fluttertoast.showToast(msg: "Veuillez sélectionner un Wallet");
        return;
      }
      // Validation nécéssaire
      if (category.value == null) {
        Fluttertoast.showToast(msg: "Veuillez sélectionner une catégorie");
        return;
      }

      // Créer le modèle wallet
      var expense = Expense(
        id: Random().nextInt(100),
        date: DateTime.now().millisecondsSinceEpoch,
        category: category.value!.id,
        wallet: wallet.value!.id,
        description: expenseDescription.value,
        amount: int.parse(expenseAmount.value),
      );

      // Appel à (similation d'une api)
      var result = await ExpenseModule.addExpense(expense);

      if (!result) {
        Fluttertoast.showToast(msg: "Expense not added");
      } else {
        Fluttertoast.showToast(msg: "Expense added");
        Get.back();
        await allExpense();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Create new expense category
  void addExpenseCategory() async {
    try {
      // Validation des entrées (String)
      var stringsValid = stringFormValidation([
        categoryname.value,
      ]);

      // Validation nécéssaire
      if (!stringsValid) {
        Fluttertoast.showToast(msg: "Veuillez bien remplir les champs");
        return;
      }

      // Créer le modèle wallet
      var category = Category(
        id: Random().nextInt(100),
        color: categorycolor.value,
        name: categoryname.value,
        currency: categorycurrency.value.toString(),
        description: categorydescription.value,
        type: categorytype.value,
      );

      // Appel à (similation d'une api)
      var result = await ExpenseModule.addExpenseCategory(category);

      if (!result) {
        Fluttertoast.showToast(msg: "Category not added");
      } else {
        Fluttertoast.showToast(msg: "Category added");
        Get.back();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
