import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/app/controllers/expense.dart';
import 'package:moneymanager/helper/helper.dart';
import 'package:moneymanager/widgets/appbar.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({
    super.key,
    required this.onSelect,
  });

  final Function onSelect;

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final controller = Get.put(ExpenseController());
  var loading = true;

  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit() async {
    controller.allCategory();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Helper.primary,
                      strokeWidth: 0.7,
                    ),
                  )
                : controller.categories.value == null
                    ? Center(
                        child: Text(
                          "No Category",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                      )
                    : Column(
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
                            title: "Select Category",
                            actions: const SizedBox(width: 26),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Obx(
                                () => Column(
                                  children: List.generate(
                                    controller.categories.value!.length,
                                    (index) {
                                      var category =
                                          controller.categories.value![index];
                                      return InkWell(
                                        onTap: () {
                                          widget.onSelect(category);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 26,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                    int.parse(
                                                          category.color
                                                              .replaceAll(
                                                            "#",
                                                            "",
                                                          ),
                                                          radix: 16,
                                                        ) +
                                                        0xFF000000,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    26,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                category.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
          },
        ),
      ),
    );
  }
}
