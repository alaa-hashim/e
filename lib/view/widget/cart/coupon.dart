// ignore_for_file: sized_box_for_whitespace, unused_local_variable

import 'package:ecommerce_app/controller/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller controller = Get.find();
    return GetBuilder<Cartcontroller>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          height: 74,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(offset: Offset.zero)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              controller.couponname == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Container(
                              width: 220,
                              height: 45,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextField(
                                  controller: controller.couponcode,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(20),
                                      hintText: 'Enter Coupon Code',
                                      hintStyle: TextStyle(),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TextButton(
                              child: const Text("Apply",
                                  style: TextStyle(
                                      color: AppColor.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                controller.checkcoupon();
                              },
                            ),
                          )
                        ])
                  : Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 40,
                                  child: Text(
                                    controller.couponname!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.green,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.check,
                                    color: AppColor.white,
                                  )),
                            ],
                          ),
                          TextButton(
                            child: const Text("Remove",
                                style: TextStyle(
                                    color: AppColor.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              controller.clearData();
                            },
                          )
                        ],
                      ),
                    ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
