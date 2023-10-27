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
          height: controller.paymentmetheod == "cash" ? 180 : 155,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(offset: Offset.zero)]),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Order Details",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(
                          controller.cartPrice.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
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
                              const Text("Discount",
                                  style: TextStyle(
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
                            const Text("Shipping fee",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(controller.shopfee.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
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
                            const Text("Payment  fee",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(controller.paymentfee.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
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
                        const Text("Subtotal",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(controller.totalorder().toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
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
