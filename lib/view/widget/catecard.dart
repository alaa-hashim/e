import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/subcategorycontroller.dart';
import '../../core/constant/appcolor.dart';
import '../../core/functions/translatedata.dart';
import '../../model/catrgory.dart';

class MyWidget extends GetView<SubcatControllerImp> {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubcatControllerImp>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(color: AppColor.bg),
        height: 120,
        alignment: Alignment.center,
        width: double.infinity,
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 0.10,
              mainAxisSpacing: 0.10,
              childAspectRatio: 1.45,
            ),
            itemCount: controller.subcategory.length,
            itemBuilder: (context, i) {
              return Categories(
                i: i,
                category: Category.fromJson(controller.subcategory[i]),
              );
            }),
      ),
    );
  }
}

class Categories extends GetView<SubcatControllerImp> {
  final Category category;
  final int? i;
  const Categories({Key? key, required this.i, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, category.categoryId!);
      },
      child: Center(
        child: GetBuilder<SubcatControllerImp>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Center(
                  child: AnimatedContainer(
                    height: 40,
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(08)),
                            color: AppColor.primaryColor,
                          )
                        : null,
                    duration: const Duration(seconds: 1),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          translateDatabase( category.categoryNameAr,category.categoryName),
                          style: const TextStyle(
                              fontSize: 14, color: AppColor.black),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
