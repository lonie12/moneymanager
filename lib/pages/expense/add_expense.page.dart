import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moneymanager/helpers/control.dart';
import 'package:moneymanager/models/category.model.dart';
import 'package:moneymanager/models/wallet.model.dart';
import 'package:moneymanager/pages/expense/category_list.page.dart';
import 'package:moneymanager/pages/wallet/wallet_list.page.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:moneymanager/helpers/utils.dart';
import 'package:moneymanager/widgets/appbar.widget.dart';
import 'package:moneymanager/widgets/custom_button.widget.dart';
import 'package:moneymanager/widgets/text_input.widget.dart';
import 'package:moneymanager/widgets/wallet_item.widget.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  var loading = true;
  final controller = Get.put(ExpenseController());
  final outline = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.1),
    borderRadius: BorderRadius.circular(6),
  );
  var amountFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    amountFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: primary,
                  strokeWidth: 0.7,
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
                    title: "New Expense",
                    actions: const SizedBox(width: 26),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      dateFormat(DateTime.now(), "complet", location: "en"),
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
                          Obx(
                            () => Align(
                              alignment: Alignment.center,
                              child: Text(
                                appCurrencyWithValue(
                                  controller.wallet.value!.currency,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          TextField(
                            controller: controller.amountController.value,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              border: outline,
                              enabledBorder: outline,
                              focusedBorder: outline,
                              hintText: "0",
                            ),
                            focusNode: amountFocus,
                            onChanged: (value) {
                              // controller.expenseAmount.value = value;
                              if (isNumeric(
                                  controller.amountController.value.text)) {
                                controller.amountController.value.text =
                                    controller.expenseAmount.value =
                                        int.parse(value).toString();
                              } else {
                                controller.amountController.value.text =
                                    controller.expenseAmount.value = "0";
                                Fluttertoast.showToast(
                                  msg: "Montant saisie invalide",
                                );
                              }
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
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
                                  "Expense title",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 15,
                                          color: const Color(0XFF006AE0),
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                Input(
                                  hintText: "Expense title",
                                  title: "Expense title",
                                  onChange: (value) {
                                    controller.expenseDescription.value = value;
                                  },
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "From account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 15,
                                          color: const Color(0XFF006AE0),
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllWallets(
                                        onSelect: (Wallet wallet) {
                                          controller.wallet.value = wallet;
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  child: Obx(
                                    () => Container(
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
                                        aname: controller.wallet.value!.name,
                                        aid: controller.wallet.value!.value,
                                        icon: walletIcons[0],
                                        abalance: controller
                                            .wallet.value!.balance
                                            .toString(),
                                        acurrency:
                                            controller.wallet.value!.currency,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "To category",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 15,
                                          color: const Color(0XFF006AE0),
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllCategory(
                                        onSelect: (Category category) {
                                          controller.category.value = category;
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  child: Obx(
                                    () => Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.7,
                                            color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 22,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                      controller
                                                          .category.value!.color
                                                          .replaceAll("#", ""),
                                                      radix: 16,
                                                    ) +
                                                    0xFF000000,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                22,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.category.value!.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Button(
                      title: "Create",
                      onClick: () {
                        controller.addExpense();
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
