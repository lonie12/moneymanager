import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneymanager/app/models/category.dart';
import 'package:moneymanager/app/models/expense.dart';
import 'package:moneymanager/app/models/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Local database configuration
class LocalStorage {
  static late SharedPreferences storage;
  static init() async {
    // Initialisation
    storage = await SharedPreferences.getInstance();
    // storage.clear();
  }

  // Local data
  static List<Wallet>? wallets;
  static List<Category>? categories;
  static List<Expense>? expenses;

  // Create and save a new wallet
  static Future<bool> addWallet(Wallet wallet) async {
    var aWallets /* All Wallet */ = wallets = getWallets();
    if (wallets == []) {
      aWallets.add(wallet);
    } else {
      var findWallet = wallets!.where(
        (e) => e.id == wallet.id || e.name == wallet.name,
      );
      if (findWallet.isNotEmpty) {
        debugPrint("Wallet already exists");
      } else {
        aWallets.add(wallet);
      }
    }
    var encoded = json.encode(aWallets);
    return await storage.setString("wallets", encoded);
  }

  // Get local saved wallets
  static List<Wallet> getWallets() {
    var data = storage.getString("wallets") ?? "[]";
    var decode = json.decode(data);
    List<Wallet> allwallets = [];
    if (decode.isNotEmpty) {
      for (var element in decode) {
        allwallets.add(Wallet.fromJson(element));
      }
    }
    return wallets = allwallets;
  }

  // Create and save a new Category
  static Future<bool> addCategory(Category category) async {
    var aCategories /* All Categories */ = categories = getCategories();
    if (categories == []) {
      aCategories.add(category);
    } else {
      var findCategory = categories!.where(
        (e) => e.id == category.id || e.name == category.name,
      );
      if (findCategory.isNotEmpty) {
        debugPrint("Category already exists");
      } else {
        aCategories.add(category);
      }
    }
    var encoded = json.encode(aCategories);
    return await storage.setString("categories", encoded);
  }

  // Get local saved categories
  static List<Category> getCategories() {
    var data = storage.getString("categories") ?? "[]";
    var decode = json.decode(data);
    List<Category> allCategories = [];
    if (decode.isNotEmpty) {
      for (var element in decode) {
        allCategories.add(Category.fromJson(element));
      }
    }
    return categories = allCategories;
  }

  // Create and save a new expense
  static Future<bool> addExpense(Expense expense) async {
    var aExpenses /* All Expenses */ = expenses = getExpenses();
    if (expenses == []) {
      aExpenses.add(expense);
    } else {
      var findExpense = expenses!.where(
        (e) => e.id == expense.id,
      );
      if (findExpense.isNotEmpty) {
        debugPrint("Expense already exists");
      } else {
        aExpenses.add(expense);
      }
    }
    var encoded = json.encode(aExpenses);
    return await storage.setString("expenses", encoded);
  }

  // Get local saved expenses
  static List<Expense> getExpenses() {
    var data = storage.getString("expenses") ?? "[]";
    var decode = json.decode(data);
    List<Expense> allExpenses = [];
    if (decode.isNotEmpty) {
      for (var element in decode) {
        allExpenses.add(Expense.fromJson(element));
      }
    }
    return expenses = allExpenses;
  }
}
