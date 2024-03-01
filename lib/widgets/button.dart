// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moneymanager/helper/helper.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.icon,
    this.title = "Suivant",
    this.onClick,
    this.background,
    this.loading = false,
    this.foreground,
  });

  final IconData? icon;
  final String? title;
  final Function? onClick;
  final Color? background;
  final bool loading;
  final Color? foreground;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () => loading ? {} : onClick!(),
      child: Builder(
        builder: (context) {
          return Container(
            height: 45,
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: background ?? Helper.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: loading
                ? const Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon != null
                          ? Icon(icon, color: Colors.white)
                          : const SizedBox(),
                      icon != null
                          ? const SizedBox(width: 8)
                          : const SizedBox(),
                      Text(
                        title!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: foreground ?? Colors.white, fontSize: 17),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
