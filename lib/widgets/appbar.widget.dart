import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Appbar({
  Widget prefix = const SizedBox(),
  Widget actions = const SizedBox(),
  String title = "",
  bool backbutton = false,
  Color? color,
}) {
  //
  return Builder(
    builder: (context) {
      return Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefix,
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: actions,
            ),
          ],
        ),
      );
    },
  );
}
