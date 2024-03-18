import 'package:moneymanager/models/category.model.dart';
import 'package:moneymanager/models/expense.model.dart';
import 'package:moneymanager/repositories/expense_repository.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 2. add a part file
part 'expense.viewmodel.g.dart';

@riverpod
Future<List<Expense>?> getAllExpense(GetAllExpenseRef ref) {
  return ref.watch(expenseRepositoryProvider).getAllExpense();
}

@riverpod
Future<List<Category>?> allCategory(AllCategoryRef ref) {
  return ref.watch(expenseRepositoryProvider).allCategory();
}
