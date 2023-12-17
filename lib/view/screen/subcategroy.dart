// ignore_for_file: unused_local_variable, must_be_immutable, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/subcategorycontroller.dart';
import '../../core/constant/appcolor.dart';
import '../../core/constant/imageasset.dart';
import '../../links.dart';
import '../../model/subcategory.dart';
import '../widget/catecard.dart';

class Subcategory extends StatelessWidget {
  const Subcategory({super.key});

  @override
  Widget build(BuildContext context) {
    SubcatController controller = Get.put(SubcatController());

    // Get the subcategories of the first category.

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.black,
                  size: 25,
                ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:GetBuilder<SubcatController>(
              builder: (controller) =>  HandlingDataView(
                statusRequest: controller.statusrequst,
                widget:ListView(
          children: [
            const MyWidget(),
             SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0.10,
                      childAspectRatio: 1.10,

                    ),
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) {
                      print("${controller.data.length}sibc");
                      return Subcat(

                        subcategories:
                        controller.data[i],
                        i: i,
                      );
                    },
                  ),
                ),
              

          ],
        ),
      ),
    )));
  }
}

class Subcat extends GetView<SubcatController> {
  final Subcategories subcategories;
  int? i;
  Subcat({super.key, required this.subcategories, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubcatController>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.homedata.redirect(AppRoute.items,{
                "selectedsub": i!,
                "subId": subcategories.subId!,
            });
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
                    translateDatabase(subcategories.subcatNamear!, subcategories.subcatName!,),
                    
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
