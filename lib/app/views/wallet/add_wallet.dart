import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/button.dart';
import 'package:moneymanager/widgets/input.dart';
import 'package:moneymanager/widgets/wallet.dart';

class AddWallet extends StatelessWidget {
  const AddWallet({super.key});

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
              title: "New Wallet",
              actions: const SizedBox(width: 26),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preview",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF006AE0)),
                  ),
                  const SizedBox(height: 6),
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
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Input(
                      hintText: "Account name",
                      title: "",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 15),
                    Input(
                      hintText: "Account number or ID",
                      title: "",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Input(
                            hintText: "Account name",
                            title: "",
                            controller: TextEditingController(),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Input(
                            hintText: "Account name",
                            title: "",
                            controller: TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Textarea(
                      hintText: "Description",
                      title: "",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 15),
                    Input(
                      hintText: "Account name",
                      title: "",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 15),
                    Input(
                      hintText: "Account name",
                      title: "",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.7,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add balance to net worth",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Switch(value: true, onChanged: (value) {})
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
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
