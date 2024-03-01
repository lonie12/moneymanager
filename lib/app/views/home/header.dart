import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helper/helper.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: Get.width,
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Worth",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: SvgPicture.asset(
                    width: 21.5,
                    fit: BoxFit.cover,
                    Helper.visibility,
                    semanticsLabel: 'Visibility',
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "5,045,300",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(text: " "),
                  TextSpan(
                    text: 'XOF',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            child: Text("Home"),
          ),
        ],
      ),
    );
  }
}