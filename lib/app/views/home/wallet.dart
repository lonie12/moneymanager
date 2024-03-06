import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/controllers/expense.dart';
import 'package:moneymanager/app/views/home/simmer.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/widgets/wallet.dart';

final controller = Get.put(ExpenseController());

class HomeWallets extends StatelessWidget {
  const HomeWallets({super.key});

  @override
  Widget build(context) {
    controller.allWallets();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade300),
      ),
      child: Obx(
        () => Column(
          children: controller.wallets.value == null
              ? List.generate(3, (index) {
                  return const ItemShimmer();
                })
              : List.generate(
                  controller.wallets.value!.length,
                  (index) {
                    var wallet = controller.wallets.value![index];
                    return Container(
                      padding: index != 0
                          ? const EdgeInsets.only(top: 20)
                          : EdgeInsets.zero,
                      child: WalletItem(
                        aname: wallet.name,
                        aid: wallet.value,
                        icon: index < walletIcons.length
                            ? walletIcons[index]
                            : walletIcons[0],
                        abalance: wallet.balance.toString(),
                        acurrency: wallet.currency.toLowerCase(),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
