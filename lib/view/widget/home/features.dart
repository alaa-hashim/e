// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/homecontroller.dart';
import '../../../controller/wishlistcontroller.dart';
import '../../../core/class/handlindatview.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/translatedata.dart';
import '../../../links.dart';
import '../../../model/product.dart';

/*class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistcont = Get.put(WishlistController());
    Get.put(HomeControllermpl());
    return SizedBox(
      height: 260,
      child: GetBuilder<HomeControllermpl>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusrequst,
          widget: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0.20,
                childAspectRatio: 1.30,
              ),
            /* itemCount: controller.views.length,
              itemBuilder: (context, i) {
                wishlistcont.isWished[controller.views[i]['product_id']] =
                    controller.views[i]['wishlist'];
                return FeatureItem(
                  product: Product.fromJson(controller.views[i]),
                );
              }),*/
        ),
      ),
    )
  }
}

class FeatureItem extends GetView<HomeControllermpl> {
  final Product product;
  const FeatureItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getImages(product.productId!);
        controller.goToPageProductDetails(product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Container(
              height: 160,
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: Text(
                    translateDatabase(
                      product.proudctNamear!.length > 20
                          ? '${product.proudctNamear!.substring(0, 20)}..'
                          : product.proudctNamear!,
                      product.productName!.length > 20
                          ? '${product.productName!.substring(0, 20)}..' // Add ".." when the string is longer
                          : product.productName!,
                    ),
                    // Use the full name if it's shorter than 20 characters
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            Row(
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
                        child: Text(product.price.toString(),
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
}*/
