// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      color: json['color'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      currency: json['currency'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'name': instance.name,
      'type': instance.type,
      'currency': instance.currency,
      'description': instance.description,
    };
