import "package:moneymanager/models/dto/wallet.dto.dart";
import "package:moneymanager/models/wallet.model.dart";
import "package:moneymanager/repositories/wallet.repository.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'wallet.viewmodel.g.dart';

// 3. use the @riverpod annotation
@riverpod
Future<List<Wallet>?> getAllWallet(GetAllWalletRef ref) {
  return ref.watch(walletRepositoryProvider).allWallet();
}

@riverpod
class WalletController extends _$WalletController {
  @override
  WalletDto build() {
    return WalletDto(
      id: 0,
      name: "",
      value: "",
      balance: 0,
      currency: "xof",
      description: "",
      icon: "bank",
      color: "F44336",
      type: "regular",
      addToNetWorth: false,
    );
  }

  updateName(String name) {
    state = state.copyWith(name: name);
  }

  updateValue(String value) {
    state = state.copyWith(value: value);
  }

  updateBalance(int balance) {
    state = state.copyWith(balance: balance);
  }

  updateCurrency(String currency) {
    state = state.copyWith(currency: currency);
  }

  updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  updateIcon(String icon) {
    state = state.copyWith(icon: icon);
  }

  updateColor(String color) {
    state = state.copyWith(color: color);
  }

  updateType(String type) {
    state = state.copyWith(type: type);
  }

  updateAddToNetWorth(bool addToNetWorth) {
    state = state.copyWith(addToNetWorth: addToNetWorth);
  }
}
