import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:moneymanager/helpers/utils.dart';
import 'package:moneymanager/widgets/appbar.widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:moneymanager/widgets/screen_menu.widget.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
              prefix: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0XFFF6F7F9),
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    fit: BoxFit.cover,
                    user,
                    semanticsLabel: 'Visibility',
                  ),
                ),
              ),
              title: "Mahugnon",
              actions: const SizedBox(),
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130),
                border: Border.all(
                  width: 2,
                  color: primary,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: FancyShimmerImage(
                  imageUrl:
                      "https://res.cloudinary.com/djyasogm6/image/upload/v1697464564/xk39jf6ubq6xs36lpiel.png",
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Mahugnon",
                // 'Ghislain TOGBE',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ScreenMenu(
                  items: settingMenu,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
