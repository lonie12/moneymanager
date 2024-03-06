// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/app/controllers/home.dart';
import 'package:moneymanager/app/views/expense/expenses.dart';
import 'package:moneymanager/app/views/home/index.dart';
import 'package:moneymanager/app/views/setting/index.dart';
import 'package:moneymanager/app/views/statistic/index.dart';
import 'package:moneymanager/helper/helper.dart';

class AppWrapper extends StatelessWidget {
  AppWrapper({super.key});

  final provider = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return PopScope(
          canPop: true,
          onPopInvoked: onWillPop,
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: provider.pageController.value,
                    children: const [
                      Home(),
                      Expenses(),
                      Statistic(),
                      Setting(),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
              ),
              child: BottomNavigationBar(
                showUnselectedLabels: true,
                onTap: (index) => provider.changeTabIndex(index),
                currentIndex: provider.tabIndex.value,
                enableFeedback: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color(0XFFFFFFFF),
                selectedLabelStyle: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Helper.textColor,
                ),
                elevation: 4,
                items: [
                  bottomNavigationBarItem(
                    icon: Helper.bdashboard,
                    label: "Dashboard",
                    id: 0,
                  ),
                  bottomNavigationBarItem(
                    icon: Helper.bcoins,
                    label: "My expenses",
                    id: 1,
                  ),
                  bottomNavigationBarItem(
                    icon: Helper.bchart,
                    label: "Statistics",
                    id: 2,
                  ),
                  bottomNavigationBarItem(
                    icon: Helper.bsetting,
                    label: "Settings",
                    id: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bottomNavigationBarItem({String? icon, String? label, int? id}) {
    // bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        width: 24,
        fit: BoxFit.cover,
        icon!,
        semanticsLabel: 'User wallet',
        colorFilter: ColorFilter.mode(
          provider.tabIndex.value == id ? Helper.primary : Helper.greyTextColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop(bool didpop) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: Helper.exitwarning);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
