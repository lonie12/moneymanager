import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/views/home/chart.dart';
import 'package:moneymanager/app/views/home/header.dart';
import 'package:moneymanager/app/views/home/wallet.dart';
import 'package:moneymanager/app/views/wallet/add_wallet.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  () => const AddWallet(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 500),
                ),
                child: const Icon(CarbonIcons.add, size: 26),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12),
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    HomeHeader(),
                    SizedBox(height: 25),
                    DashboardChart(),
                    SizedBox(height: 25),
                    HomeWallets(),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
