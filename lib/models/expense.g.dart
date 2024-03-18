// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: json['id'] as int,
      date: json['date'] as int,
      category: json['category'] as int,
      wallet: json['wallet'] as int,
      amount: json['amount'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'category': instance.category,
      'wallet': instance.wallet,
      'amount': instance.amount,
      'description': instance.description,
    };
