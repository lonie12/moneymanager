// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:formz/formz.dart';
// import 'package:moneymanager/app/forms/forms.dart';
// import 'package:moneymanager/app/forms/presentation.dart';

// class SignInController extends StateNotifier<SignInState> {
//   SignInController() : super(const SignInState());

//   FormzStatus validate({EmailFormz? email, PasswordFormz? password}) {
//     return Formz.validate([email ?? state.email, password ?? state.password]);
//   }

//   void updateEmail(String value) {
//     final email = EmailFormz.dirty(value);
//     state = state.copyWith(email: email, status: validate(email: email));
//   }

//   void updatePassword(String value) {
//     final password = PasswordFormz.dirty(value);
//     state = state.copyWith(
//         password: password, status: validate(password: password));
//   }
// }

// final signInNotifierProvider =
//     StateNotifierProvider<SignInController, SignInState>(
//   (ref) {
//     return SignInController();
//   },
// );
