import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/pages/expense/add_epense_category.page.dart';
import 'package:moneymanager/pages/expense/add_expense.page.dart';
import 'package:moneymanager/pages/home/simmer.widget.dart.dart';
import 'package:moneymanager/helpers/constants.dart';
import 'package:moneymanager/viewmodels/expense.viewmodel.dart';
import 'package:moneymanager/widgets/appbar.widget.dart';
import 'package:moneymanager/widgets/expense_item.widget.dart';

class Expenses extends ConsumerWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(getAllExpenseProvider);
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
                    user,
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
                child: Column(
                  children: expenses.when(
                    data: (data) {
                      return List.generate(
                        data!.length,
                        (index) {
                          var expense = data[index];
                          return ExpenseItem(expense: expense);
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
              ),
            ),
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
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ModalItem(
                  icon: CarbonIcons.application,
                  title: "Add new Category",
                  onClick: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddExpenseCategory(),
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade300, height: 0.7),
                ModalItem(
                  icon: CarbonIcons.piggy_bank,
                  title: "Add new Expense",
                  onClick: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddExpense(),
                    ),
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
