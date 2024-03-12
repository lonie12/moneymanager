import 'package:freezed_annotation/freezed_annotation.dart';

// class Expense {
//   Expense({
//     required this.id,
//     required this.date,
//     required this.category,
//     required this.wallet,
//     required this.amount,
//     required this.description,
//   });

//   int id;
//   String date;
//   int category;
//   int wallet;
//   int amount;
//   String description;

//   factory Expense.fromJson(Map<String, dynamic> json) {
//     return Expense(
//       id: json["id"],
//       date: json["date"].toString(),
//       category: json["category"],
//       wallet: json["wallet"],
//       amount: json["amount"],
//       description: json["description"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "date": date,
//         "category": category,
//         "wallet": wallet,
//         "amount": amount,
//         "description": description,
//       };
// }

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required int id,
    required int date,
    required int category,
    required int wallet,
    required int amount,
    required String description,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
