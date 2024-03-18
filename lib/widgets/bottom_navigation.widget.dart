// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/pages/expense/expense_list.page.dart';
import 'package:moneymanager/pages/home/home.page.dart';
import 'package:moneymanager/pages/setting/settings.page.dart';
import 'package:moneymanager/pages/statistic/statistics.page.dart';
import 'package:moneymanager/helpers/constants.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Expenses(),
    const Statistic(),
    const Setting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0XFFFFFFFF),
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        elevation: 4,
        showSelectedLabels: true,
        items: [
          bottomNavigationBarItem(
            icon: bdashboard,
            label: "Dashboard",
            id: 0,
          ),
          bottomNavigationBarItem(
            icon: bcoins,
            label: "My expenses",
            id: 1,
          ),
          bottomNavigationBarItem(
            icon: bchart,
            label: "Statistics",
            id: 2,
          ),
          bottomNavigationBarItem(
            icon: bsetting,
            label: "Settings",
            id: 3,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
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
          _selectedIndex == id ? primary : greyTextColor,
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
      Fluttertoast.showToast(msg: exitwarning);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
