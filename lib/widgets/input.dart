import 'package:flutter/material.dart';
import 'package:moneymanager/helper/helper.dart';

var outline2 = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.grey, width: 0.7),
  borderRadius: BorderRadius.circular(4),
);

class Input extends StatelessWidget {
  Input({
    super.key,
    required this.hintText,
    required this.title,
    required this.controller,
    this.color,
    this.prefixicon,
    this.suffixicon,
    this.isPassword,
    this.visibility,
    this.pTap,
    this.prefixIsWidget = false,
    this.prefixWidget,
    this.maxlines = 1,
    this.type,
  });

  final outline = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.7),
    borderRadius: BorderRadius.circular(8),
  );

  final String hintText;
  final String title;
  final TextEditingController controller;
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

  @override
  Widget build(context) {
    return TextField(
      obscureText: visibility ?? false,
      controller: controller,
      maxLines: maxlines,
      keyboardType: type ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        // prefixIcon:
        suffixIcon: isPassword == true
            ? InkWell(
                onTap: () => pTap!(),
                child: Icon(
                  visibility == false ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : Icon(
                suffixicon,
                size: 20,
                color: Helper.greyTextColor,
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        filled: true,
        fillColor: color ?? Colors.white,
        // hoverColor: Helper.greyTextColor,
        hintText: hintText,
        border: outline,
        enabledBorder: outline,

        focusedBorder: outline,
      ),
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 15, color: Helper.textColor),
    );
  }
}

class Textarea extends StatelessWidget {
  Textarea({
    super.key,
    required this.hintText,
    required this.title,
    required this.controller,
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
  });

  final outline = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.7),
    borderRadius: BorderRadius.circular(6),
  );

  final String hintText;
  final String title;
  final TextEditingController controller;
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

  @override
  Widget build(context) {
    return TextField(
      controller: controller,
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
          .copyWith(fontSize: 15, color: Helper.textColor),
    );
  }
}
