// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletDto _$WalletDtoFromJson(Map<String, dynamic> json) => WalletDto(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String,
      value: json['value'] as String,
      balance: json['balance'] as int,
      currency: json['currency'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$WalletDtoToJson(WalletDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'balance': instance.balance,
      'currency': instance.currency,
      'description': instance.description,
      'addToNetworth': instance.addToNetWorth,
      'icon': instance.icon,
      'color': instance.color,
      'type': instance.type,
    };
