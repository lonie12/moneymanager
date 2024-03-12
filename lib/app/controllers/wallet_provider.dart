import "package:moneymanager/helper/constants.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'wallet_provider.g.dart';

@riverpod
class WalletAccountName extends _$WalletAccountName {
  @override
  String build() => "";

  void update(String value) => state = value;
}

@riverpod
class WalletAccountId extends _$WalletAccountId {
  @override
  String build() => "";

  void update(value) => state = value;
}

@riverpod
class WalletAccountIcon extends _$WalletAccountIcon {
  @override
  String build() => appIcons[0]["value"] as String;

  void update(value) => state = value;
}

@riverpod
class WalletAccountColor extends _$WalletAccountColor {
  @override
  String build() => appColors[0]["value"] as String;

  void update(value) => state = value;
}

@riverpod
class WalletAccountDescription extends _$WalletAccountDescription {
  @override
  String build() => "";

  void update(value) => state = value;
}

@riverpod
class WalletAccountType extends _$WalletAccountType {
  @override
  String build() => accountTypes[0]["value"] as String;

  void update(value) => state = value;
}

@riverpod
class WalletAccountCurrency extends _$WalletAccountCurrency {
  @override
  String build() => appCurrencies[0]["value"] as String;

  void update(value) => state = value;
}

@riverpod
class WalletAccountBalance extends _$WalletAccountBalance {
  @override
  String build() => "0.0";

  void update(value) => state = value;
}

@riverpod
class AddToNetWorth extends _$AddToNetWorth {
  @override
  bool build() => false;

  void update(value) => state = value;
}
