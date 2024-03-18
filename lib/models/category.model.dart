import 'package:freezed_annotation/freezed_annotation.dart'
    hide JsonSerializable;
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moneymanager/models/dto/add_category.dto.dart';

part 'category.model.freezed.dart';
part 'category.model.g.dart';

@JsonSerializable()
@freezed
abstract class Category extends HiveObject with _$Category {
  Category._();

  @HiveType(typeId: 0)
  factory Category({
    @HiveField(0) required int id,
    @HiveField(1) required String color,
    @HiveField(2) required String name,
    @HiveField(3) required String type,
    @HiveField(4) required String currency,
    @HiveField(5) required String description,
  }) = _Category;

  //
  static Category fromObject(CategoryDto categoryDto) {
    return Category(
      id: categoryDto.id,
      color: categoryDto.color,
      name: categoryDto.name,
      type: categoryDto.type,
      currency: categoryDto.currency,
      description: categoryDto.description,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

class CateogryAdapter extends TypeAdapter<Category> {
  @override
  final typeId = 0;

  @override
  Category read(BinaryReader reader) {
    return Category(
      id: reader.read(),
      color: reader.read(),
      name: reader.read(),
      type: reader.read(),
      currency: reader.read(),
      description: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer.write(obj.id);
    writer.write(obj.color);
    writer.write(obj.name);
    writer.write(obj.type);
    writer.write(obj.currency);
    writer.write(obj.description);
  }
}
