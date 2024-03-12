import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneymanager/app/controllers/wallet_provider.dart';
import 'package:moneymanager/helper/utils.dart';
import 'package:moneymanager/widgets/wallet.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/button.dart';
import 'package:moneymanager/widgets/input.dart';
import 'package:moneymanager/widgets/textarea.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/widgets/selectable.dart';
import 'package:moneymanager/app/controllers/wallet.dart';

class AddWallet extends ConsumerWidget {
  AddWallet({super.key});

  final controller = Get.put(WalletController());

  @override
  Widget build(context, ref) {
    final accountName = ref.watch(walletAccountNameProvider);
    final addToNetworth = ref.watch(addToNetWorthProvider);
    final balance = ref.watch(walletAccountBalanceProvider);
    final accountId = ref.watch(walletAccountIdProvider);
    final accountIcon = ref.watch(walletAccountIconProvider);
    final accountColor = ref.watch(walletAccountColorProvider);
    final accountCurrency = ref.watch(walletAccountCurrencyProvider);
    final accountType = ref.watch(walletAccountTypeProvider);
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
                    child: WalletItem(
                      icon: appIconWithValue(accountIcon),
                      aid: accountId,
                      aname: accountName,
                      abalance: balance,
                      acurrency: accountCurrency,
                    ),
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
                      onChange: (value) {
                        ref
                            .read(walletAccountNameProvider.notifier)
                            .update(value);
                      },
                    ),
                    const SizedBox(height: 15),
                    Input(
                        hintText: "Account number or ID",
                        title: "",
                        onChange: (value) {
                          ref
                              .read(walletAccountIdProvider.notifier)
                              .update(value);
                        }),
                    const SizedBox(height: 15),
                    Input(
                      hintText: "Account balance",
                      title: "",
                      onChange: (value) {
                        if (isNumeric(balance)) {
                          ref
                              .read(walletAccountBalanceProvider.notifier)
                              .update(value);
                        } else {
                          ref
                              .read(walletAccountBalanceProvider.notifier)
                              .update("0.0");
                          Fluttertoast.showToast(
                            msg: "Montant saisie invalide",
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Selectable(
                            values: appIcons,
                            title: "Icon",
                            type: "icon",
                            value: accountIcon,
                            onChange: (value) {
                              ref
                                  .read(walletAccountIconProvider.notifier)
                                  .update(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Selectable(
                            values: appColors,
                            title: "Color",
                            type: "colors",
                            value: accountColor,
                            onChange: (value) {
                              ref
                                  .read(walletAccountColorProvider.notifier)
                                  .update(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Textarea(
                      hintText: "Description",
                      title: "",
                      onChange: () {},
                    ),
                    const SizedBox(height: 15),
                    Selectable(
                      values: accountTypes,
                      title: "Account type",
                      type: "text",
                      value: accountType,
                      onChange: (value) {
                        ref
                            .read(walletAccountTypeProvider.notifier)
                            .update(value);
                      },
                    ),
                    const SizedBox(height: 15),
                    Selectable(
                      values: appCurrencies,
                      title: "Account currency",
                      type: "text",
                      value: accountCurrency,
                      onChange: (value) {
                        ref
                            .read(walletAccountCurrencyProvider.notifier)
                            .update(value);
                      },
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
                          Switch(
                            value: addToNetworth,
                            onChanged: (value) {
                              ref.read(addToNetWorthProvider.notifier).update(
                                    value,
                                  );
                            },
                          ),
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
              child: Button(
                title: "Create",
                onClick: () => controller.addWallet(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
