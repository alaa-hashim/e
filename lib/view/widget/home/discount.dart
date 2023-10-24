import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/homecontroller.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/wishlistcontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../links.dart';
import '../../../model/product.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistcont = Get.put(WishlistController());
    Get.put(HomeControllermpl());
    return SizedBox(
      height: 500,
      child: GetBuilder<HomeControllermpl>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusrequst,
          widget: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.20,
                childAspectRatio: 1.30,
              ),
              itemCount: controller.discount.length,
              itemBuilder: (context, i) {
                wishlistcont.isWished[controller.discount[i]['product_id']] =
                    controller.discount[i]['wishlist'];
                return DiscountItem(
                  product: Product.fromJson(controller.discount[i]),
                );
              }),
        ),
      ),
    );
  }
}

class DiscountItem extends GetView<HomeControllermpl> {
  final Product product;
  const DiscountItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getViews(product.productId);
        controller.goToPageProductDetails(product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 230,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(children: [
            Container(
              height: 150,
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
            Positioned(
                top: 125,
                left: 105,
                child: GetBuilder<WishlistController>(
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
                        )))),
            Positioned(
              top: 160,
              left: 10,
              child: Text(
                translateDatabase(product.proudctNamear, product.productName),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
                top: 190,
                left: 10,
                child: Row(
                  children: [
                    Text("42".tr,
                        style: Theme.of(context).textTheme.titleSmall),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.itemdiscount.toString(),
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                )),
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
