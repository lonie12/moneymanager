import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/helper/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final List<ChartData> chartData = [
  ChartData(1, 35),
  ChartData(2, 23),
  ChartData(3, 34),
];

const List<String> list = [
  'Weekly',
  'Monthly',
  'Yearly',
];

var outline2 = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.shade300, width: 0.1),
  borderRadius: BorderRadius.circular(6),
);

var outline = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
  borderRadius: BorderRadius.circular(6),
);

class DashboardChart extends StatelessWidget {
  const DashboardChart({super.key});

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        width: 21.5,
                        fit: BoxFit.cover,
                        Helper.stats,
                        semanticsLabel: 'Visibility',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Major expenses",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton(
                    value: list[0],
                    underline: const SizedBox(),
                    items: list.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {},
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 170,
            child: SfCartesianChart(
              series: <CartesianSeries>[
                BarSeries<ChartData, double>(
                  width: 0.5,
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  borderRadius: BorderRadius.circular(4),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
