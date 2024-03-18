import 'package:moneymanager/helpers/api.dart';
import 'package:moneymanager/models/category.model.dart';
import 'package:moneymanager/models/expense.model.dart';
import 'package:moneymanager/helpers/localstorage.dart';

var client = ApiClient();

class ExpenseModule {
  // add expense api call method
  static Future<bool> addExpenseCategory(Category category) async {
    return await LocalStorage.addCategory(category);
  }

  // expense list
  static Future<List<Category>> getExpenseCategories() async {
    return LocalStorage.getCategories();
  }

  // add expense api call method
  static Future<bool> addExpense(Expense expense) async {
    return await LocalStorage.addExpense(expense);
  }

  // expense list
  static Future<List<Expense>> getExpenses() async {
    return LocalStorage.getExpenses();
  }

  // all Category (local + remeote)
  static dynamic allCategory() async {
    return client.get("categories/");
  }

  // all Expenses (local + remeote)
  static dynamic allExpense() async {
    return client.get("expense/");
  }
}
