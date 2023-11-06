// ignore_for_file: sized_box_for_whitespace, unused_local_variable, must_be_immutable, use_key_in_widget_constructors

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/view/widget/cart/coupon.dart';
import 'package:ecommerce_app/view/widget/cart/subtotal.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/cartcontroller.dart';
import '../../core/constant/imageasset.dart';

import '../widget/cart/cartitems.dart';

class Cartscreen extends StatelessWidget {
  Cartscreen({Key? key});

  Cartcontroller controller = Get.put(Cartcontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.bg,
          appBar: AppBar(
            
            title:  Center(
              child: Text(
                "46".tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.black,
                  size: 25,
                ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: AppColor.black),
              )
            ],
          ),
          body: InkWell(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Obx(
              () => HandlingDataView(
                statusRequest: controller.statusrequst,
                widget: controller.data.isNotEmpty
                    ? Column(
                        children: [
                          Expanded(
                              child: ListView(
                            shrinkWrap: true,
                            children: const [
                              Carttems(),
                              Coupon(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Subtotal(),
                              ),
                            ],
                          )),
                          Container(
                            width: double.infinity,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: AppColor.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${controller.data.length} Items",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.getTotal().toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  focusColor: AppColor.white,
                                  padding: const EdgeInsets.only(
                                    left: 125,
                                    right: 125,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  color: AppColor.black,
                                  textColor: AppColor.white,
                                  onPressed: () {
                                    controller.goTocheckout();
                                  },
                                  child:  Text(
                                    "70".tr,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(
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
            ),
          )),
    );
  }
}
