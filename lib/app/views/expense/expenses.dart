import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/controllers/expense.dart';
import 'package:moneymanager/app/views/expense/add_epense_category.dart';
import 'package:moneymanager/app/views/expense/add_expense.dart';
import 'package:moneymanager/app/views/home/simmer.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';
import 'package:moneymanager/widgets/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final controller = Get.put(ExpenseController());

  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit() async {
    debugPrint("====");
    await controller.allExpense();
  }

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
                  color: const Color(0XFFF6F7F9),
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    fit: BoxFit.cover,
                    Helper.user,
                    semanticsLabel: 'Visibility',
                  ),
                ),
              ),
              title: "Mahugnon",
              actions: const ModalBottom(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(
                  () => Column(
                    children: controller.loading.value
                        ? List.generate(3, (index) {
                            return const ItemShimmer();
                          })
                        : List.generate(
                            controller.expenses.value!.length,
                            (index) {
                              var expense = controller.expenses.value![index];
                              return ExpenseItem(expense: expense);
                            },
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ModalBottom extends StatelessWidget {
  const ModalBottom({super.key});

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ModalItem(
                  icon: CarbonIcons.application,
                  title: "Add new Category",
                  onClick: () => Get.to(
                    () => AddExpenseCategory(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
                Divider(color: Colors.grey.shade300, height: 0.7),
                ModalItem(
                  icon: CarbonIcons.piggy_bank,
                  title: "Add new Expense",
                  onClick: () => Get.to(
                    () => const AddExpense(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      child: const Icon(CarbonIcons.add, size: 26),
    );
  }
}

class ModalItem extends StatelessWidget {
  const ModalItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });

  final IconData icon;
  final String title;
  final Function onClick;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          onClick();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(icon),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
