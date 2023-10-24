// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/subcategorycontroller.dart';
import '../../core/class/handlindatview.dart';
import '../../core/constant/imageasset.dart';
import '../../links.dart';
import '../../model/subcategory.dart';

import '../widget/category/catlist.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SubcatControllerImp());

    // Get the subcategories of the first category.

    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 100, child: Catelist()),
                  SizedBox(
                    width: 200,
                    child: GetBuilder<SubcatControllerImp>(
                      builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusrequst,
                        widget: SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: GridView.builder(
                            padding: const EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0.20,
                              childAspectRatio: 1.10,
                            ),
                            itemCount: controller.data.length,
                            itemBuilder: (context, i) {
                              return Subcat(
                                subcategories:
                                    Subcategories.fromJson(controller.data[i]),
                                i: i,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Subcat extends GetView<SubcatControllerImp> {
  final Subcategories subcategories;
  int? i;
  Subcat({Key? key, required this.subcategories, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubcatControllerImp>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.goTproduct(
                controller.subcategory, i!, subcategories.subId!);
          },
          child: FittedBox(
            child: SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: subcategories.image!.isNotEmpty
                        ? CachedNetworkImage(
                            height: 110,
                            imageUrl:
                                "${AppLink.imagestSubategories}/${subcategories.image!}",
                          )
                        : Center(
                            child: Lottie.asset(
                              AppImageAsset.noImage,
                              width: 100,
                              height: 100,
                            ),
                          ),
                  ),
                  Text(
                    subcategories.subcatName!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
