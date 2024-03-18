// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      id: json['id'] as int,
      name: json['name'] as String,
      value: json['value'] as String,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'balance': instance.balance,
      'currency': instance.currency,
      'description': instance.description,
    };
