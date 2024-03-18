import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/pages/home/home_chart.widget.dart';
import 'package:moneymanager/pages/home/home_header.widget.dart';
import 'package:moneymanager/pages/home/home_wallet.widget.dart';
import 'package:moneymanager/pages/wallet/add_wallet.page.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:moneymanager/widgets/appbar.widget.dart';

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
                    user,
                    semanticsLabel: 'Visibility',
                  ),
                ),
              ),
              title: "Mahugnon",
              actions: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddWallet()),
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
