// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allWalletHash() => r'874f16d380f32b04efac367460303236db654e00';

/// See also [allWallet].
@ProviderFor(allWallet)
final allWalletProvider = AutoDisposeFutureProvider<List<Wallet>?>.internal(
  allWallet,
  name: r'allWalletProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllWalletRef = AutoDisposeFutureProviderRef<List<Wallet>?>;
String _$allExpenseHash() => r'f4897efb410fee9d834e96837e1780365056b141';

/// See also [allExpense].
@ProviderFor(allExpense)
final allExpenseProvider = AutoDisposeFutureProvider<List<Expense>?>.internal(
  allExpense,
  name: r'allExpenseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allExpenseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllExpenseRef = AutoDisposeFutureProviderRef<List<Expense>?>;
String _$allCategoryHash() => r'44482179a17002dc2052376d6fb278619c48c5ea';

/// See also [allCategory].
@ProviderFor(allCategory)
final allCategoryProvider = AutoDisposeFutureProvider<List<Category>?>.internal(
  allCategory,
  name: r'allCategoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllCategoryRef = AutoDisposeFutureProviderRef<List<Category>?>;
String _$selectedCategoryHash() => r'd79f42e153f18bb935f2e6299a2ca1ed87286731';

/// See also [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider =
    AutoDisposeNotifierProvider<SelectedCategory, Category>.internal(
  SelectedCategory.new,
  name: r'selectedCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategory = AutoDisposeNotifier<Category>;
String _$selectedWalletHash() => r'a8717e96f0c3e00b37b5f45701bc9187baba3edf';

/// See also [SelectedWallet].
@ProviderFor(SelectedWallet)
final selectedWalletProvider =
    AutoDisposeNotifierProvider<SelectedWallet, Wallet>.internal(
  SelectedWallet.new,
  name: r'selectedWalletProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedWallet = AutoDisposeNotifier<Wallet>;
String _$selectedExpenseHash() => r'3024763e6232dde0ae7f908526494696307545bd';

/// See also [SelectedExpense].
@ProviderFor(SelectedExpense)
final selectedExpenseProvider =
    AutoDisposeNotifierProvider<SelectedExpense, Expense>.internal(
  SelectedExpense.new,
  name: r'selectedExpenseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedExpenseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedExpense = AutoDisposeNotifier<Expense>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
