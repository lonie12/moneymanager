import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/app/models/expense.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/helper/utils.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0XFFE6F1FC),
                  ),
                  child: SizedBox(
                    height: 22,
                    width: 22,
                    child: SvgPicture.asset(
                      fit: BoxFit.cover,
                      Helper.hand,
                      semanticsLabel: 'Visibility',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expense.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dateFormat(
                          DateTime.fromMillisecondsSinceEpoch(
                            int.parse(expense.date),
                          ),
                          "complet",
                          location: "fr",
                        ),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12, color: Colors.grey.shade500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          RichText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: expense.amount.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              children: [
                const TextSpan(text: " "),
                TextSpan(
                  text: 'XOF',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
