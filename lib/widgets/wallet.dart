import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({super.key, required this.icon});

  final String icon;

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
                      "UBA Bank",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "501234567890",
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
        RichText(
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "5,045,300",
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
    );
  }
}
