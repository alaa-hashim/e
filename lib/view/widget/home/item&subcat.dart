// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/wishlistcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/homecontroller.dart';


import '../../../controller/subcatanditemscontroller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/translatedata.dart';
import '../../../links.dart';
import '../../../model/product.dart';

class SubcatandItem extends StatelessWidget {
  const SubcatandItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Do not create controllers inside the build method, instead, create them outside.
    
     SubcatandItemscontroller scontroller = Get.put(SubcatandItemscontroller());

    

    return Container(
      color: AppColor.bg,
      child: GetBuilder<SubcatandItemscontroller>(
        builder: (controller) => 
         ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        translateDatabase(
                                scontroller.data[i].subcatNamear, scontroller.data[i].subcatName) ,
                          
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 260,
                  child:Items(i: i)
                ),
              ],
            );
          },
          itemCount: scontroller.data.length,
        ),
      ),
    );
  }
}
class Items extends StatelessWidget {
  final int i;
  const Items({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    SubcatandItemscontroller controller = Get.put(SubcatandItemscontroller());
    WishlistController wishlistcont = Get.find<WishlistController>();
    HomeControllermpl hcontroller = Get.put(HomeControllermpl());

    // Filter controller.data1 based on the condition
    List<Product> filteredItems = controller.data1
        // ignore: unrelated_type_equality_checks
        .where((item) => item.subcatId == controller.data[i].subId)
        .toList();
    filteredItems = filteredItems.take(4).toList();

    return SizedBox(
      height: 100,
      child: GetBuilder<SubcatandItemscontroller>(
        builder: (controller) => 
         GridView.builder(
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
              physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 0.20,
            childAspectRatio: 1.20,
          ),
          itemCount: filteredItems.length, // Use filtered data
          itemBuilder: (context, i) {
            wishlistcont.isWished[filteredItems[i].productId] =
                    filteredItems[i].wish;
            return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              hcontroller.getViews(filteredItems[i].productId);
        hcontroller.getImages(filteredItems[i].productId!);
        hcontroller.goToPageProductDetails(filteredItems[i]);
        hcontroller.getrecoomm(filteredItems[i].productId!, filteredItems[i].subcatId.toString());
            },
            child: Container(
              height: 250,
              width: 180,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Container(
                  height: 165,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: filteredItems[i].proudctImg!.isNotEmpty
                      ? CachedNetworkImage(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl:
                              "${AppLink.imagestItems}/${filteredItems[i].proudctImg!}",
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
                  padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: Row(
                    children: [
                      Text(
                        translateDatabase(
                          filteredItems[i].proudctNamear!.length > 20
                              ? '${filteredItems[i].proudctNamear!.substring(0, 18)}..'
                              : filteredItems[i].proudctNamear!,
                          filteredItems[i].productName!.length > 20
                              ? '${filteredItems[i].productName!.substring(0, 18)}..' // Add ".." when the string is longer
                              : filteredItems[i].productName!,
                        ),
                        // Use the full name if it's shorter than 20 characters
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("42".tr,
                                style: Theme.of(context).textTheme.titleSmall),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(filteredItems[i].itemdiscount.toString(),
                                  style: Theme.of(context).textTheme.titleLarge),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<WishlistController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isWished[filteredItems[i].productId] == "1") {
                                  controller.setWished(filteredItems[i].productId, "0");
                                  controller.deletewish(filteredItems[i].productId);
                                } else {
                                  controller.setWished(filteredItems[i].productId, "1");
                                  controller.addwish(filteredItems[i].productId);
                                }
                              },
                              icon: Icon(
                                controller.isWished[filteredItems[i].productId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              ))),
                    ],
                  ),
                ),
                /*Positioned(
                  bottom: 188,
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {},
                    badgeContent: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Center(
                        child: Text("Sales",
                            style: TextStyle(color: AppColor.white, fontSize: 15)),
                      ),
                    ),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.instagram,
                      badgeColor: AppColor.red,
                      padding: const EdgeInsets.all(5),
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.white, width: 2),
                      elevation: 0,
                    ),
                  ),
                )*/
              ]),
            ),
          ),
        );
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Product product;
  const Item({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    HomeControllermpl controller = Get.put(HomeControllermpl());
    return InkWell(
      onTap: () {
        controller.getViews(product.productId);
        controller.getImages(product.productId!);
        controller.goToPageProductDetails(product);
        controller.getrecoomm(product.productId!, product.subcatId.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          width: 180,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Container(
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: product.proudctImg!.isNotEmpty
                  ? CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl:
                          "${AppLink.imagestItems}/${product.proudctImg!}",
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
              padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
              child: Row(
                children: [
                  Text(
                    translateDatabase(
                      product.proudctNamear!.length > 20
                          ? '${product.proudctNamear!.substring(0, 18)}..'
                          : product.proudctNamear!,
                      product.productName!.length > 20
                          ? '${product.productName!.substring(0, 18)}..' // Add ".." when the string is longer
                          : product.productName!,
                    ),
                    // Use the full name if it's shorter than 20 characters
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("42".tr,
                            style: Theme.of(context).textTheme.titleSmall),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(product.itemdiscount.toString(),
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<WishlistController>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isWished[product.productId] == "1") {
                              controller.setWished(product.productId, "0");
                              controller.deletewish(product.productId);
                            } else {
                              controller.setWished(product.productId, "1");
                              controller.addwish(product.productId);
                            }
                          },
                          icon: Icon(
                            controller.isWished[product.productId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ))),
                ],
              ),
            ),
            /*Positioned(
              bottom: 188,
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -12),
                showBadge: true,
                ignorePointer: false,
                onTap: () {},
                badgeContent: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Center(
                    child: Text("Sales",
                        style: TextStyle(color: AppColor.white, fontSize: 15)),
                  ),
                ),
                badgeAnimation: const badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.instagram,
                  badgeColor: AppColor.red,
                  padding: const EdgeInsets.all(5),
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                ),
              ),
            )*/
          ]),
        ),
      ),
    );
  }
}
