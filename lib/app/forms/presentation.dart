import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moneymanager/app/forms/forms.dart';

part 'presentation.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    // @Default(FormzStatus.pure) FormzStatus status,
  }) = _SignInState;
}
