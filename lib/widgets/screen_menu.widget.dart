import 'package:flutter/material.dart';
import 'package:moneymanager/helpers/constants.dart';

class ScreenMenu extends StatelessWidget {
  const ScreenMenu({
    super.key,
    required this.items,
  });

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    var activeItems = items.where((element) => element["featured"]).toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activeItems.length,
          itemBuilder: (context, index) {
            var item = activeItems[index];
            return InkWell(
              onTap: () => item['onTap'](context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: index < activeItems.length - 1
                      ? Border(
                          bottom: BorderSide(
                              width: 0.3, color: Colors.grey.shade400),
                        )
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            item['icon'],
                            size: 22,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: textColor),
                            ),
                            Text(
                              item['description'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                    // Icon(Icons.chevron_right)
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
