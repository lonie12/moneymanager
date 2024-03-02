import 'package:flutter/material.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/wallet.dart';

class HomeWallets extends StatelessWidget {
  const HomeWallets({super.key});

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade300),
      ),
      child: Column(
        children: List.generate(
          3,
          (index) {
            return Container(
              padding:
                  index != 0 ? const EdgeInsets.only(top: 20) : EdgeInsets.zero,
              child: WalletItem(
                aname: "UBA Bank",
                aid: "501234567890",
                icon: Helper.walletIcons[index],
                abalance: "5,045,300",
                acurrency: "XOF",
              ),
            );
          },
        ),
      ),
    );
  }
}
