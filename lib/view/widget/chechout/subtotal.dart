import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkoutcontroller.dart';
import '../../../core/constant/appcolor.dart';

class Checkoutsubtotal extends StatelessWidget {
  const Checkoutsubtotal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Container(
          height: controller.paymentmetheod == "cash" ? 150 : 120,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(offset: Offset.zero)]),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("80".tr,
                           style:Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("74".tr,
                            style:Theme.of(context).textTheme.titleMedium),
                        Text(
                          controller.cartPrice.toString(),
                           style:Theme.of(context).textTheme.titleMedium
                        )
                      ]),
                ),
                // ignore: unrelated_type_equality_checks
                controller.discountcoupon! > 0
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("75".tr,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.green)),
                              Text("-   ${controller.discountcoupon}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.green))
                            ]),
                      )
                    : const SizedBox.shrink(),
                controller.cartPrice! < 100
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text("81".tr,
                                style:Theme.of(context).textTheme.titleMedium),
                            Text(controller.shopfee.toString(),
                                style:Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                controller.paymentmetheod == "cash"
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text("82".tr,
                                style:Theme.of(context).textTheme.titleMedium),
                            Text(controller.paymentfee.toString(),
                                style:Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("76".tr,
                            style:Theme.of(context).textTheme.titleMedium),
                        Text(controller.totalorder().toString(),
                            style:Theme.of(context).textTheme.titleMedium)
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
