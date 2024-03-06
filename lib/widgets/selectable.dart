import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helper/helper.dart';

// Item select
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
