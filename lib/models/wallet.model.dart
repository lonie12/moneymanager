import 'package:freezed_annotation/freezed_annotation.dart'
    hide JsonSerializable;
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moneymanager/models/dto/wallet.dto.dart';

part "wallet.model.freezed.dart";
part "wallet.model.g.dart";

@JsonSerializable()
@freezed
abstract class Wallet extends HiveObject with _$Wallet {
  Wallet._();

  @HiveType(typeId: 0)
  factory Wallet({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String value,
    @HiveField(3) required double balance,
    @HiveField(4) required String currency,
    @HiveField(5) required String description,
  }) = _Wallet;

  //
  static Wallet fromObject(WalletDto walletDto) {
    return Wallet(
      id: walletDto.id,
      name: walletDto.name,
      value: walletDto.value,
      balance: double.parse(walletDto.balance.toString()),
      currency: walletDto.currency,
      description: walletDto.description,
    );
  }

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

class WalletAdapter extends TypeAdapter<Wallet> {
  @override
  final typeId = 0;

  @override
  Wallet read(BinaryReader reader) {
    return Wallet(
      id: reader.read(),
      name: reader.read(),
      value: reader.read(),
      balance: reader.read(),
      currency: reader.read(),
      description: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Wallet obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.value);
    writer.write(obj.balance);
    writer.write(obj.currency);
    writer.write(obj.description);
  }
}
