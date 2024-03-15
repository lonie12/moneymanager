import 'package:moneymanager/app/models/category.dart';
import 'package:moneymanager/app/models/expense.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:moneymanager/app/repository/expense_repository.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 2. add a part file
part 'expense.viewmodel.g.dart';

// 3. use the @riverpod annotation
@riverpod
Future<List<Wallet>?> allWallet(AllWalletRef ref) {
  return ref.watch(expenseRepositoryProvider).allWallet();
}

@riverpod
Future<List<Expense>?> allExpense(AllExpenseRef ref) {
  return ref.watch(expenseRepositoryProvider).allExpense();
}

@riverpod
Future<List<Category>?> allCategory(AllCategoryRef ref) {
  return ref.watch(expenseRepositoryProvider).allCategory();
}
