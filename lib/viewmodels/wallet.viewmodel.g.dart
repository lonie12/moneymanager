// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllWalletHash() => r'158ef8393ff22cfde8f4b99f08b97e4570d8aba0';

/// See also [getAllWallet].
@ProviderFor(getAllWallet)
final getAllWalletProvider = AutoDisposeFutureProvider<List<Wallet>?>.internal(
  getAllWallet,
  name: r'getAllWalletProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllWalletRef = AutoDisposeFutureProviderRef<List<Wallet>?>;
String _$walletControllerHash() => r'41596fcd50f8906b702d414e1167eb54acb66b85';

/// See also [WalletController].
@ProviderFor(WalletController)
final walletControllerProvider =
    AutoDisposeNotifierProvider<WalletController, WalletDto>.internal(
  WalletController.new,
  name: r'walletControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WalletController = AutoDisposeNotifier<WalletDto>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
