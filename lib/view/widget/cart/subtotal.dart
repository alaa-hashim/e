// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:ecommerce_app/controller/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';

class Subtotal extends StatelessWidget {
  const Subtotal({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller controller = Get.find();

    return GetBuilder<Cartcontroller>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Container(
          height: controller.discountcoupon != 0 ? 100 : 80,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(offset: Offset.zero)]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("74".tr,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                        controller.cartPrice.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                controller.discountcoupon != 0
                    ? Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("75".tr,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.green)),
                              Text("Free  ${controller.discountcoupon}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.green))
                            ]),
                      )
                    : const SizedBox.shrink(),
                const Divider(
                  thickness: 1,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("76".tr,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(controller.getTotal().toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
