// class Category {
//   Category({
//     required this.id,
//     required this.color,
//     required this.name,
//     required this.type,
//     required this.currency,
//     required this.description,
//   });

//   int id;
//   String color;
//   String name;
//   String type;
//   String currency;
//   String description;

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json["id"],
//       color: json["color"],
//       name: json["name"],
//       type: json["type"],
//       currency: json["currency"],
//       description: json["description"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "color": color,
//         "name": name,
//         "type": type,
//         "currency": currency,
//         "description": description,
//       };
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String color,
    required String name,
    required String type,
    required String currency,
    required String description,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
