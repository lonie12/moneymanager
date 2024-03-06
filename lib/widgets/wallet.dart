import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/helper/utils.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({
    super.key,
    required this.icon,
    required this.aid,
    required this.aname,
    required this.acurrency,
    required this.abalance,
  });

  final String icon;
  final String aid; // Account Id
  final String aname; // Account name
  final String acurrency; // Account currency
  final String abalance; // Account currency

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0XFFDADCE0),
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    width: 21.5,
                    fit: BoxFit.cover,
                    icon,
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
                      aname,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      aid,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 12, color: Colors.grey.shade500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        Text(
          utilsThousandSeparator(
            double.tryParse(abalance) ?? 0.0,
            appCurrencyWithValue(acurrency),
          ),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
