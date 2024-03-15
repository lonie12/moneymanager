// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletDto {
  @JsonKey(name: 'id', defaultValue: 0001)
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'addToNetworth',
      defaultValue: 0,
      includeToJson: true,
      includeFromJson: false)
  bool? get addToNetWorth => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'icon',
      defaultValue: "bank",
      includeToJson: true,
      includeFromJson: false)
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'color',
      defaultValue: "F44336",
      includeToJson: true,
      includeFromJson: false)
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'type',
      defaultValue: "regular",
      includeToJson: true,
      includeFromJson: false)
  String? get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletDtoCopyWith<WalletDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDtoCopyWith<$Res> {
  factory $WalletDtoCopyWith(WalletDto value, $Res Function(WalletDto) then) =
      _$WalletDtoCopyWithImpl<$Res, WalletDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0001) int id,
      String name,
      String value,
      int balance,
      String currency,
      String description,
      @JsonKey(
          name: 'addToNetworth',
          defaultValue: 0,
          includeToJson: true,
          includeFromJson: false)
      bool? addToNetWorth,
      @JsonKey(
          name: 'icon',
          defaultValue: "bank",
          includeToJson: true,
          includeFromJson: false)
      String? icon,
      @JsonKey(
          name: 'color',
          defaultValue: "F44336",
          includeToJson: true,
          includeFromJson: false)
      String? color,
      @JsonKey(
          name: 'type',
          defaultValue: "regular",
          includeToJson: true,
          includeFromJson: false)
      String? type});
}

/// @nodoc
class _$WalletDtoCopyWithImpl<$Res, $Val extends WalletDto>
    implements $WalletDtoCopyWith<$Res> {
  _$WalletDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? balance = null,
    Object? currency = null,
    Object? description = null,
    Object? addToNetWorth = freezed,
    Object? icon = freezed,
    Object? color = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      addToNetWorth: freezed == addToNetWorth
          ? _value.addToNetWorth
          : addToNetWorth // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletDtoImplCopyWith<$Res>
    implements $WalletDtoCopyWith<$Res> {
  factory _$$WalletDtoImplCopyWith(
          _$WalletDtoImpl value, $Res Function(_$WalletDtoImpl) then) =
      __$$WalletDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0001) int id,
      String name,
      String value,
      int balance,
      String currency,
      String description,
      @JsonKey(
          name: 'addToNetworth',
          defaultValue: 0,
          includeToJson: true,
          includeFromJson: false)
      bool? addToNetWorth,
      @JsonKey(
          name: 'icon',
          defaultValue: "bank",
          includeToJson: true,
          includeFromJson: false)
      String? icon,
      @JsonKey(
          name: 'color',
          defaultValue: "F44336",
          includeToJson: true,
          includeFromJson: false)
      String? color,
      @JsonKey(
          name: 'type',
          defaultValue: "regular",
          includeToJson: true,
          includeFromJson: false)
      String? type});
}

/// @nodoc
class __$$WalletDtoImplCopyWithImpl<$Res>
    extends _$WalletDtoCopyWithImpl<$Res, _$WalletDtoImpl>
    implements _$$WalletDtoImplCopyWith<$Res> {
  __$$WalletDtoImplCopyWithImpl(
      _$WalletDtoImpl _value, $Res Function(_$WalletDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? balance = null,
    Object? currency = null,
    Object? description = null,
    Object? addToNetWorth = freezed,
    Object? icon = freezed,
    Object? color = freezed,
    Object? type = freezed,
  }) {
    return _then(_$WalletDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      addToNetWorth: freezed == addToNetWorth
          ? _value.addToNetWorth
          : addToNetWorth // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WalletDtoImpl extends _WalletDto {
  _$WalletDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0001) required this.id,
      required this.name,
      required this.value,
      required this.balance,
      required this.currency,
      required this.description,
      @JsonKey(
          name: 'addToNetworth',
          defaultValue: 0,
          includeToJson: true,
          includeFromJson: false)
      this.addToNetWorth,
      @JsonKey(
          name: 'icon',
          defaultValue: "bank",
          includeToJson: true,
          includeFromJson: false)
      this.icon,
      @JsonKey(
          name: 'color',
          defaultValue: "F44336",
          includeToJson: true,
          includeFromJson: false)
      this.color,
      @JsonKey(
          name: 'type',
          defaultValue: "regular",
          includeToJson: true,
          includeFromJson: false)
      this.type})
      : super._();

  @override
  @JsonKey(name: 'id', defaultValue: 0001)
  final int id;
  @override
  final String name;
  @override
  final String value;
  @override
  final int balance;
  @override
  final String currency;
  @override
  final String description;
  @override
  @JsonKey(
      name: 'addToNetworth',
      defaultValue: 0,
      includeToJson: true,
      includeFromJson: false)
  final bool? addToNetWorth;
  @override
  @JsonKey(
      name: 'icon',
      defaultValue: "bank",
      includeToJson: true,
      includeFromJson: false)
  final String? icon;
  @override
  @JsonKey(
      name: 'color',
      defaultValue: "F44336",
      includeToJson: true,
      includeFromJson: false)
  final String? color;
  @override
  @JsonKey(
      name: 'type',
      defaultValue: "regular",
      includeToJson: true,
      includeFromJson: false)
  final String? type;

  @override
  String toString() {
    return 'WalletDto(id: $id, name: $name, value: $value, balance: $balance, currency: $currency, description: $description, addToNetWorth: $addToNetWorth, icon: $icon, color: $color, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.addToNetWorth, addToNetWorth) ||
                other.addToNetWorth == addToNetWorth) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, value, balance,
      currency, description, addToNetWorth, icon, color, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDtoImplCopyWith<_$WalletDtoImpl> get copyWith =>
      __$$WalletDtoImplCopyWithImpl<_$WalletDtoImpl>(this, _$identity);
}

abstract class _WalletDto extends WalletDto {
  factory _WalletDto(
      {@JsonKey(name: 'id', defaultValue: 0001) required final int id,
      required final String name,
      required final String value,
      required final int balance,
      required final String currency,
      required final String description,
      @JsonKey(
          name: 'addToNetworth',
          defaultValue: 0,
          includeToJson: true,
          includeFromJson: false)
      final bool? addToNetWorth,
      @JsonKey(
          name: 'icon',
          defaultValue: "bank",
          includeToJson: true,
          includeFromJson: false)
      final String? icon,
      @JsonKey(
          name: 'color',
          defaultValue: "F44336",
          includeToJson: true,
          includeFromJson: false)
      final String? color,
      @JsonKey(
          name: 'type',
          defaultValue: "regular",
          includeToJson: true,
          includeFromJson: false)
      final String? type}) = _$WalletDtoImpl;
  _WalletDto._() : super._();

  @override
  @JsonKey(name: 'id', defaultValue: 0001)
  int get id;
  @override
  String get name;
  @override
  String get value;
  @override
  int get balance;
  @override
  String get currency;
  @override
  String get description;
  @override
  @JsonKey(
      name: 'addToNetworth',
      defaultValue: 0,
      includeToJson: true,
      includeFromJson: false)
  bool? get addToNetWorth;
  @override
  @JsonKey(
      name: 'icon',
      defaultValue: "bank",
      includeToJson: true,
      includeFromJson: false)
  String? get icon;
  @override
  @JsonKey(
      name: 'color',
      defaultValue: "F44336",
      includeToJson: true,
      includeFromJson: false)
  String? get color;
  @override
  @JsonKey(
      name: 'type',
      defaultValue: "regular",
      includeToJson: true,
      includeFromJson: false)
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$WalletDtoImplCopyWith<_$WalletDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
