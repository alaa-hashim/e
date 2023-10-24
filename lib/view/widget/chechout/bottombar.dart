import 'package:ecommerce_app/controller/checkoutcontroller.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';

class Checkoutbottom extends StatelessWidget {
  const Checkoutbottom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
              statusRequest: controller.statusrequst,
              widget: Container(
                width: double.infinity,
                height: controller.shopfee == 0 ? 90 : 120,
                decoration: const BoxDecoration(
                  color: AppColor.white,
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.data.length}Items",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.totalorder().toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                      focusColor: AppColor.white,
                      padding: const EdgeInsets.only(
                          left: 125, right: 125, top: 10, bottom: 10),
                      color: AppColor.black,
                      textColor: AppColor.white,
                      onPressed: () {
                        controller.checkout();
                      },
                      child: const Text(
                        " Place order",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ))
                ]),
              ),
            ));
  }
}

class Uncheckoutbottom extends StatelessWidget {
  const Uncheckoutbottom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Container(
        width: double.infinity,
        height: 120,
        decoration: const BoxDecoration(
          color: AppColor.white,
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${controller.data.length}Items",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.totalorder().toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          MaterialButton(
              focusColor: AppColor.white,
              padding: const EdgeInsets.only(
                  left: 125, right: 125, top: 10, bottom: 10),
              color: AppColor.darkgray,
              textColor: AppColor.white,
              onPressed: () {
                if (controller.paymentmetheod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Payment method is not selected."),
                    ),
                  );
                }
              },
              child: const Text(
                " Place order",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
