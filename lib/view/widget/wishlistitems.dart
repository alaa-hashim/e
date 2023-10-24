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
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 0.65,
        ),
        itemCount: controller.data.length,
        itemBuilder: (context, i) {
          return Wishitem(
            wish: Wishlist.fromJson(controller.data[i]),
          );
        });
  }
}

class Wishitem extends StatelessWidget {
  final Wishlist wish;
  const Wishitem({super.key, required this.wish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: wish.proudctImg.isNotEmpty
                ? CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
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
          Positioned(
            top: 175,
            left: 25,
            child: Text(
              translateDatabase(wish.proudctNamear, wish.productName),
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 70,
            child: Text(
              wish.price,
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
              top: 210,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 2),
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
              ))
        ],
      ),
    );
  }
}
