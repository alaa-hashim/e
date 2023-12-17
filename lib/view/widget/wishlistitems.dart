import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/wishlistcontroller.dart';
import '../../core/constant/appcolor.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/translatedata.dart';
import '../../links.dart';
import '../../model/wishlist.dart';

// ignore: must_be_immutable
class Wishitems extends StatelessWidget {
  Wishitems({super.key});
  WishlistController controller = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 0.65,
          ),
          itemCount: controller.shoping.wishlist.length,
          itemBuilder: (context, i) {
             controller.isWished[controller.shoping.wishlist[i].productId] =
                      controller.shoping.wishlist[i].wishlistId;
            return  Wishitem(
              wish: controller.shoping.wishlist[i],
            );
          }),
    );
  }
}

class Wishitem extends StatelessWidget {
  final Wishlist wish;
  const Wishitem({super.key, required this.wish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: AppColor.white,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: wish.proudctImg.isNotEmpty
                  ? CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 170,
                      imageUrl: "${AppLink.imagestItems}/${wish.proudctImg}",
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
              translateDatabase(wish.proudctNamear.length > 20
                            ? '${wish.proudctNamear.substring(0, 20)}..'
                            : wish.proudctNamear,
                        wish.productName.length > 20
                            ? '${wish.productName.substring(0, 20)}..' // Add ".." when the string is longer
                            : wish.productName),
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                      children: [
                        Text("42".tr,
                            style: Theme.of(context).textTheme.titleSmall),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(wish.price ,
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ],
                    ),
                    GetBuilder<WishlistController>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isWished[wish.productId] == "1") {
                              controller.setWished(wish.productId, "0");
                              controller.deletewish(wish.productId);
                            } else {
                              controller.setWished(wish.productId, "1");
                              controller.addwish(wish.productId);
                            }
                          },
                          icon: Icon(
                            controller.isWished[wish.productId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 2),
              child: Container(
                height: 35,
                width: 160,
                decoration: const BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "ADD TO CART",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
