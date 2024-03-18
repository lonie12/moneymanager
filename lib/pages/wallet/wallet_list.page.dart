import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helpers/control.dart';
import 'package:moneymanager/models/wallet.model.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:moneymanager/widgets/appbar.widget.dart';
import 'package:moneymanager/widgets/wallet_item.widget.dart';

class AllWallets extends StatefulWidget {
  const AllWallets({
    super.key,
    required this.onSelect,
  });

  final Function onSelect;

  @override
  State<AllWallets> createState() => _AllWalletsState();
}

class _AllWalletsState extends State<AllWallets> {
  final controller = Get.put(ExpenseController());
  var loading = true;

  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit() async {
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primary,
                      strokeWidth: 0.7,
                    ),
                  )
                : controller.wallets.value == null
                    ? Center(
                        child: Text(
                          "No wallet",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                      )
                    : Column(
                        children: [
                          Appbar(
                            prefix: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(CarbonIcons.close, size: 26),
                              ),
                            ),
                            title: "Select Wallet",
                            actions: const SizedBox(width: 26),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Obx(() => Column(
                                    children: List.generate(
                                      controller.wallets.value!.length,
                                      (index) {
                                        var walletData =
                                            controller.wallets.value![index];
                                        var wallet = Wallet(
                                          id: walletData.id,
                                          name: walletData.name,
                                          value: walletData.value,
                                          balance: walletData.balance,
                                          currency: walletData.currency,
                                          description: walletData.description,
                                        );
                                        return InkWell(
                                          onTap: () {
                                            widget.onSelect(wallet);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: WalletItem(
                                              icon: walletIcons[0],
                                              aid: wallet.value,
                                              aname: wallet.name,
                                              acurrency: wallet.currency,
                                              abalance:
                                                  wallet.balance.toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )),
                            ),
                          )
                        ],
                      );
          },
        ),
      ),
    );
  }
}
