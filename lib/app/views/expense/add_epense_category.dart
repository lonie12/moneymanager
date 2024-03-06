import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/controllers/expense.dart';
import 'package:moneymanager/helper/constants.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/button.dart';
import 'package:moneymanager/widgets/input.dart';
import 'package:moneymanager/widgets/selectable.dart';
import 'package:moneymanager/widgets/textarea.dart';

class AddExpenseCategory extends StatelessWidget {
  AddExpenseCategory({super.key});
  final controller = Get.put(ExpenseController());

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
              title: "New Category",
              actions: const SizedBox(width: 26),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Obx(
                  () => Column(
                    children: [
                      const SizedBox(height: 20),
                      Input(
                        hintText: "Category name",
                        title: "",
                        onChange: (value) {
                          controller.categoryname.value = value;
                        },
                      ),
                      const SizedBox(height: 15),
                      Selectable(
                        values: appColors,
                        title: "Color",
                        type: "colors",
                        value: controller.categorycolor.value,
                        onChange: (value) {
                          controller.categorycolor.value = value;
                        },
                      ),
                      const SizedBox(height: 15),
                      Textarea(
                        hintText: "Description",
                        title: "",
                        onChange: () {},
                      ),
                      const SizedBox(height: 15),
                      Selectable(
                        values: categoryTypes,
                        title: "Category type",
                        type: "text",
                        value: controller.categorytype.value,
                        onChange: (value) {
                          controller.categorytype.value = value;
                        },
                      ),
                      const SizedBox(height: 15),
                      Selectable(
                        values: appCurrencies,
                        title: "Currency",
                        type: "text",
                        value: controller.categorycurrency.value.toString(),
                        onChange: (value) {
                          controller.categorycurrency.value = value;
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
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add sub category",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                            ),
                            const Icon(CarbonIcons.add),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Button(
                title: "Create",
                onClick: () => controller.addExpenseCategory(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
