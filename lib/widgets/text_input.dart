import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextInput extends ConsumerWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final bool obscureText;

  final TextInputType inputType;

  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  const TextInput({
    Key? key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.validator,
    this.onEditingComplete,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 15, bottom: 4),
            width: MediaQuery.of(context).size.width,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
          autocorrect: false,
          keyboardType: inputType,
          validator: validator,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        )
      ],
    );
  }
}
