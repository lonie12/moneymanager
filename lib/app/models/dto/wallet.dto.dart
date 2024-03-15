import 'package:freezed_annotation/freezed_annotation.dart'
    hide JsonSerializable;
import 'package:json_annotation/json_annotation.dart';

part 'wallet.dto.g.dart';
part 'wallet.dto.freezed.dart';

@JsonSerializable()
@freezed
abstract class WalletDto extends JsonSerializable with _$WalletDto {
  WalletDto._();
  factory WalletDto({
    @JsonKey(
      name: 'id',
      defaultValue: 0001,
    )
    required int id,
    required String name,
    required String value,
    required int balance,
    required String currency,
    required String description,
    @JsonKey(
      name: 'addToNetworth',
      defaultValue: 0,
      includeToJson: true,
      includeFromJson: false,
    )
    bool? addToNetWorth,
    @JsonKey(
      name: 'icon',
      defaultValue: "bank",
      includeToJson: true,
      includeFromJson: false,
    )
    String? icon,
    @JsonKey(
      name: 'color',
      defaultValue: "F44336",
      includeToJson: true,
      includeFromJson: false,
    )
    String? color,
    @JsonKey(
      name: 'type',
      defaultValue: "regular",
      includeToJson: true,
      includeFromJson: false,
    )
    String? type,
  }) = _WalletDto;

  factory WalletDto.fromJson(Map<String, dynamic> json) =>
      _$WalletDtoFromJson(json);
}
