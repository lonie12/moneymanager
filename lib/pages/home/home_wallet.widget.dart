import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymanager/viewmodels/wallet.viewmodel.dart';
import 'package:moneymanager/pages/home/simmer.widget.dart.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:moneymanager/widgets/wallet_item.widget.dart';

class HomeWallets extends ConsumerStatefulWidget {
  const HomeWallets({super.key});

  @override
  ConsumerState<HomeWallets> createState() => _HomeWalletsState();
}

class _HomeWalletsState extends ConsumerState<HomeWallets> {
  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(getAllWalletProvider);
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
            debugPrint(e.toString());
            debugPrint(st.toString());
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
