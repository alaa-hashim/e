import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homecontroller.dart';
import '../../../controller/subcategorycontroller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../model/catrgory.dart';

class Catelist extends GetView<HomeControllermpl> {
  const Catelist({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllermpl>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(color: AppColor.bg),
        alignment: Alignment.center,
        width: double.infinity,
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 0.10,
              mainAxisSpacing: 0.10,
              childAspectRatio: 1.45,
            ),
            itemCount: controller.category.length,
            itemBuilder: (context, i) {
              return Categories(
                i: i,
                category: Category.fromJson(controller.category[i]),
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
                    height: controller.selectedCat == i ? 45 : 35,
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            border: Border(left: BorderSide(width: 2)),
                            color: AppColor.white,
                          )
                        : null,
                    duration: const Duration(seconds: 1),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          translateDatabase(category.categoryNameAr, category.categoryName)
                          ,
                          style: Theme.of(context).textTheme.titleSmall,
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
