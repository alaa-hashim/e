import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:ecommerce_app/model/catrgory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/homecontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../links.dart';

class Homecategory extends StatelessWidget {
  const Homecategory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllermpl());
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: GetBuilder<HomeControllermpl>(
          builder: (controller) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.category.length,
              itemBuilder: (context, i) {
                return CatItem(
                  i: i,
                  category: Category.fromJson(controller.category[i]),
                );
              })),
    );
  }
}

class CatItem extends GetView<HomeControllermpl> {
  final int? i;
  final Category category;
  const CatItem({super.key, required this.i, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTosub(controller.category, i!, category.categoryId!);
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.white),
              child: category.categoryImage!.isNotEmpty
                  ? Center(
                      child: CachedNetworkImage(
                        width: 70,
                        height: 70,
                        imageUrl:
                            "${AppLink.imagestCategories}/${category.categoryImage!}",
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                  : Center(
                      child: Lottie.asset(
                        AppImageAsset.noImage,
                        width: 100,
                        height: 100,
                      ),
                    ),
            ),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    translateDatabase(
                        category.categoryNameAr, category.categoryName),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )),
          ],
        ),
      ).animate().slideX(
          duration: const Duration(seconds: 2), begin: -1, curve: Curves.ease),
    );
  }
}
