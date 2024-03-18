import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Text(
        "Statistiques",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
