import 'package:flutter/material.dart';
import 'package:moneymanager/helpers/constants.dart';

class Textarea extends StatelessWidget {
  Textarea({
    super.key,
    required this.hintText,
    required this.title,
    // required this.controller,
    this.color,
    this.prefixicon,
    this.suffixicon,
    this.isPassword,
    this.visibility,
    this.pTap,
    this.prefixIsWidget = false,
    this.prefixWidget,
    this.maxlines = 4,
    this.type,
    required this.onChange,
  });

  final outline = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.7),
    borderRadius: BorderRadius.circular(6),
  );

  final String hintText;
  final String title;
  // final TextEditingController controller;
  final TextInputType? type;
  // final errors;
  final int maxlines;
  final Color? color;
  final IconData? prefixicon;
  final IconData? suffixicon;
  final bool? isPassword;
  final bool? visibility;
  final Function? pTap;
  final bool? prefixIsWidget;
  final Widget? prefixWidget;
  final Function onChange;

  @override
  Widget build(context) {
    return TextField(
      onChanged: (value) => onChange(value) ?? () {},
      maxLines: maxlines,
      keyboardType: type ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        border: outline,
        enabledBorder: outline,
        focusedBorder: outline,
        fillColor: Colors.white,
        hintText: hintText,
      ),
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 15, color: textColor),
    );
  }
}
