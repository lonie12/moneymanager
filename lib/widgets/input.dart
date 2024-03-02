import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helper/helper.dart';

class Input extends StatelessWidget {
  Input({
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
    this.maxlines = 1,
    this.type,
    required this.onChange,
  });

  final outline = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.7),
    borderRadius: BorderRadius.circular(8),
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
      obscureText: visibility ?? false,
      // controller: controller,
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
          .copyWith(fontSize: 15, color: Helper.textColor),
    );
  }
}

class Selectable extends StatelessWidget {
  const Selectable({
    super.key,
    required this.title,
    required this.type,
    required this.values,
    required this.value,
    required this.onChange,
  });

  final String title;
  final String type; // icon, text, colors
  final List<Map<String, String>> values;
  final String value;
  final Function onChange;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5),
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.7),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 15,
                  color: Helper.textColor,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 45.5,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 0.5,
            //     color: Colors.grey.shade300,
            //   ),
            //   borderRadius: BorderRadius.circular(4),
            // ),
            child: DropdownButton(
              icon: const Icon(
                CarbonIcons.chevron_sort,
                size: 21,
                color: Color(0XFF006AE0),
              ),
              value: value,
              underline: const SizedBox(),
              items: values.map((e) {
                return DropdownMenuItem(
                  value: e["value"],
                  child: Container(
                    padding: const EdgeInsets.only(right: 6),
                    child: type == "text"
                        ? Text(e["key"]!)
                        : type == "icon"
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                  fit: BoxFit.cover,
                                  e["key"]!,
                                  semanticsLabel: 'Visibility',
                                ),
                              )
                            : type == "colors"
                                ? Container(
                                    width: 21,
                                    height: 21,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Color(
                                        int.parse(e["key"]!, radix: 16) +
                                            0xFF000000,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                  ),
                );
              }).toList(),
              onChanged: (value) => onChange(value),
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
          ),
        ],
      ),
    );
  }
}
