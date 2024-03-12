import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymanager/app/controllers/expense_provider.dart';
import 'package:moneymanager/app/views/home/simmer.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/widgets/wallet.dart';

class HomeWallets extends ConsumerWidget {
  const HomeWallets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(allWalletProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade300),
      ),
      child: Column(
        children: wallets.when(
          data: (data) {
            return List.generate(
              data!.length,
              (index) {
                var wallet = data[index];
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
            );
          },
          error: (e, st) {
            return List.generate(3, (index) {
              return const ItemShimmer();
            });
          },
          loading: () => List.generate(3, (index) {
            return const ItemShimmer();
          }),
        ),
      ),
    );
  }
}
