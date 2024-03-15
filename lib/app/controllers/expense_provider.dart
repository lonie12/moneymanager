// import 'package:moneymanager/app/models/category.dart';
// import 'package:moneymanager/app/models/expense.dart';
// import 'package:moneymanager/app/models/wallet.dart';
// import 'package:moneymanager/app/repository/expense_repository.dart';
// // 1. import the riverpod_annotation package
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// // 2. add a part file
// part 'expense_provider.g.dart';

// // 3. use the @riverpod annotation
// @riverpod
// Future<List<Wallet>?> allWallet(AllWalletRef ref) {
//   return ref.watch(expenseRepositoryProvider).allWallet();
// }

// @riverpod
// Future<List<Expense>?> allExpense(AllExpenseRef ref) {
//   return ref.watch(expenseRepositoryProvider).allExpense();
// }

// @riverpod
// Future<List<Category>?> allCategory(AllCategoryRef ref) {
//   return ref.watch(expenseRepositoryProvider).allCategory();
// }

// // @riverpod
// // class Counter extends _$Counter {
// //   @override
// //   int build() => 0;
// //   void increment() => state = state + 1;
// // }

// // @riverpod
// // class ExpenseTitle extends _$ExpenseTitle {
// //   @override
// //   String build() => "";
// //   void update() => state = state;
// // }

// @riverpod
// class SelectedCategory extends _$SelectedCategory {
//   @override
//   Category build() => Category.fromJson({});
//   void update() => state = state;
// }

// @riverpod
// class SelectedWallet extends _$SelectedWallet {
//   @override
//   Wallet build() => Wallet.fromJson({});
//   void update() => state = state;
// }

// @riverpod
// class SelectedExpense extends _$SelectedExpense {
//   @override
//   Expense build() => Expense.fromJson({});
//   void update() => state = state;
// }
