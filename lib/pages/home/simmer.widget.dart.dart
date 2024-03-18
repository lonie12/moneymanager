import 'package:flutter/material.dart';
import 'package:moneymanager/widgets/skeleton.widget.dart';

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border:
            const Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleSkeleton(size: 45),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleSkeleton(height: 18, width: 150),
                  SingleSkeleton(height: 16, width: 90),
                ],
              ),
            ],
          ),
          SingleSkeleton(height: 20, width: 40),
        ],
      ),
    );
  }
}
