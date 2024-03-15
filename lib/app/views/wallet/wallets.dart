import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/controllers/expense.dart';
import 'package:moneymanager/app/models/wallet.model.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/wallet.widget.dart';

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
    controller.allWallets();
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
                ? Center(
                    child: CircularProgressIndicator(
                      color: Helper.primary,
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
                                onTap: () => Get.back(),
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
