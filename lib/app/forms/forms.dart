import 'package:formz/formz.dart';
import 'package:moneymanager/helper/utils.dart';

enum EmailValidationError {
  empty,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Email can\'t be empty';
      case invalid:
        return 'Invalid email';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty(String value) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.length < 4) return EmailValidationError.empty;

    if (!EmailSubmitRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

enum PasswordValidationError {
  empty,
  tooShort,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Password can\'t be empty';
      case tooShort:
        return 'Password is too short';
      case invalid:
        return 'Must contain at least 1 characters and 1 symbol';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty(String value) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return PasswordValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}
