import 'package:freezed_annotation/freezed_annotation.dart'
    hide JsonSerializable;
import 'package:json_annotation/json_annotation.dart';

part 'add_category.dto.g.dart';
part 'add_category.dto.freezed.dart';

@JsonSerializable()
@freezed
abstract class CategoryDto extends JsonSerializable with _$CategoryDto {
  CategoryDto._();
  factory CategoryDto({
    required int id,
    required String color,
    required String name,
    required String type,
    required String currency,
    required String description,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
