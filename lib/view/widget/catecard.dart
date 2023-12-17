// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/subcategorycontroller.dart';
import '../../core/constant/appcolor.dart';
import '../../core/functions/translatedata.dart';
import '../../model/catrgory.dart';

class MyWidget extends GetView<SubcatController> {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubcatController>(
      builder: (controller) => 
         Container(
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
              itemCount: controller.shoping.category.length,
              itemBuilder: (context, i) {
                print("${controller.shoping.category.length}shoping.category");
                return Categories(
                  i: i,
                  category: controller.shoping.category[i],
                );
              }),
        ),
      
    );
  }
}

class Categories extends GetView<SubcatController> {
  final Category category;
  final int i;
  const Categories({super.key, required this.i, required this.category});

  @override
  Widget build(BuildContext context) {
    SubcatController  controller = Get.put(SubcatController());
    return InkWell(
      onTap: () {

    controller.changeCat(i, category.categoryId);
    print(category.categoryId);

},
      child: Center(
        child: GetBuilder<SubcatController>(
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
                          translateDatabase(category.categoryNameAr ?? "", category.categoryName ?? "")
,
                          style:  TextStyle(
                              fontSize: 14, color:controller.selectedCat == i ? AppColor.white : AppColor.black),
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
