import 'package:flutter/foundation.dart' hide Category;
import 'package:moneymanager/helpers/hive_init.dart';
import 'package:moneymanager/models/category.model.dart';
import 'package:moneymanager/models/dto/add_category.dto.dart';

class ExpenseMethod {
  // Create and save a new expense
  // static Future<bool> addExpense(Expense expense) async {
  //   var result = true;
  //   var expenses = getExpenses();
  //   var findExpense = expenses!.where(
  //     (e) => e.id == expense.id,
  //   );
  //   if (findExpense.isNotEmpty) {
  //     debugPrint("Expense already exists");
  //   } else {
  //     aExpenses.add(expense);
  //   }
  //   if (expenses == []) {
  //     exp.add(expense);
  //   } else {}
  //   var encoded = json.encode(aExpenses);
  //   return await storage.setString("expenses", encoded);
  // }

  // // Get local saved expenses
  // static List<Expense> getExpenses() {
  //   var data = storage.getString("expenses") ?? "[]";
  //   var decode = json.decode(data);
  //   List<Expense> allExpenses = [];
  //   if (decode.isNotEmpty) {
  //     for (var element in decode) {
  //       allExpenses.add(Expense.fromJson(element));
  //     }
  //   }
  //   return expenses = allExpenses;
  // }

  // Create and save a new Category
  static Future<bool> addCategory(CategoryDto categoryDto) async {
    var result = true;
    var categories = getCategories();
    var findCategory = categories.where(
      (e) => e.id == categoryDto.id || e.name == categoryDto.name,
    );
    if (findCategory.isNotEmpty) {
      debugPrint("Category already exists");
      result = false;
    } else {
      categories.add(Category.fromObject(categoryDto));
    }
    await HiveLocal.categoryBox.delete("categoryItems");
    await HiveLocal.categoryBox.putAll({"categoryItems": categories});
    return result;
  }

  // Get local saved categories
  static List<Category> getCategories() {
    final categories = HiveLocal.categoryBox.get("categoryItems");
    return categories ?? <Category>[];
  }
}
