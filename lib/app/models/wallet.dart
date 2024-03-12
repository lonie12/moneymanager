import 'package:freezed_annotation/freezed_annotation.dart';

part "wallet.freezed.dart";
part "wallet.g.dart";

// class Wallet {
//   Wallet({
//     required this.id,
//     required this.value,
//     required this.name,
//     required this.balance,
//     required this.currency,
//     required this.description,
//   });

//   int id;
//   String value;
//   String name;
//   double balance;
//   String currency;
//   String description;

//   factory Wallet.fromJson(Map<String, dynamic> json) {
//     return Wallet(
//       id: json["id"],
//       value: json["value"],
//       name: json["name"],
//       balance: double.parse(json["balance"].toString()),
//       currency: json["currency"].toLowerCase(),
//       description: json["description"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "value": value,
//         "name": name,
//         "balance": balance,
//         "currency": currency,
//         "description": description,
//       };
// }

@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    required int id,
    required String value,
    required String name,
    required double balance,
    required String currency,
    required String description,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
