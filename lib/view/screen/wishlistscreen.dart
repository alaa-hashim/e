// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/wishlistcontroller.dart';
import '../../core/class/handlindatview.dart';
import '../../core/constant/imageasset.dart';
import '../widget/wishlistitems.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});
  WishlistController controller = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.bg,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Obx(
            () => HandlingDataView(
              statusRequest: controller.statusrequst,
              widget: controller.data.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                            child: ListView(
                          shrinkWrap: true,
                          children: [
                            Wishitems(),
                          ],
                        )),
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              "Your shopping cart looks empty",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Center(
                              child: Lottie.asset(
                                AppImageAsset.cartimage,
                                width: 250,
                                height: 200,
                              ),
                            ),
                            MaterialButton(
                              color: AppColor.black,
                              textColor: AppColor.white,
                              onPressed: () {},
                              child: const Text(" START SHOPPING"),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          )),
    );
  }
}
