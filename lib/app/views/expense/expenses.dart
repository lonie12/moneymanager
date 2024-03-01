import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/views/expense/add_expense.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/expense.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

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
                    Helper.user,
                    semanticsLabel: 'Visibility',
                  ),
                ),
              ),
              title: "Lonie",
              actions: InkWell(
                onTap: () => Get.to(
                  () => const AddExpense(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 500),
                ),
                child: const Icon(CarbonIcons.add, size: 26),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: List.generate(12, (index) => const ExpenseItem()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
