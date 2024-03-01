import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/button.dart';
import 'package:moneymanager/widgets/input.dart';
import 'package:moneymanager/widgets/wallet.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

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
                ),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(CarbonIcons.close, size: 26),
                ),
              ),
              title: "New Expense",
              actions: const SizedBox(width: 26),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                "Thursday, September 21, 2023",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "XOF",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "8,000",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From account",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16,
                                    color: const Color(0XFF006AE0),
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.7,
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: WalletItem(icon: Helper.walletIcons[0]),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "To category",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16,
                                    color: const Color(0XFF006AE0),
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Input(
                            hintText: "Account number or ID",
                            title: "",
                            controller: TextEditingController(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: const Button(title: "Create"),
            )
          ],
        ),
      ),
    );
  }
}
