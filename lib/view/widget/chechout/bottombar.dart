import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/controller/checkoutcontroller.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/services/stripepayment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';
import '../../screen/address/addressmap.dart';

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
                      left: 125,
                      right: 125,
                      top: 10,
                      bottom: 10,
                    ),
                    color: AppColor.black,
                    textColor: AppColor.white,
                    onPressed: () async {
                      if (controller.paymentmetheod == "card") {
                        try {
                          await PaymentManager.makePayment(
                            controller.totalorder(), // Pass the amount to pay
                            "AED", // Pass the currency
                          );
                          // Payment has been successfully completed, now check the address.
                          if (controller.data.isEmpty) {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.noHeader,
                              headerAnimationLoop: false,
                              animType: AnimType.scale,
                              title: 'Warning',
                              desc:
                                  'You haven\'t set an address. Add a new one.',
                              buttonsTextStyle:
                                  const TextStyle(color: Colors.black),
                              showCloseIcon: true,
                              btnOkOnPress: () {
                                Get.to(const Addressmap());
                              },
                              btnCancelOnPress: () {},
                            ).show();
                          } else {
                            controller
                                .checkout(); // Call checkout when the address is set.
                          }
                        } catch (error) {
                          // Handle payment error if needed.
                          // You can show an error message here.
                        }
                      } else {
                        // Handle the case when the payment method is not "card".
                      }
                    },
                    child: const Text(
                      "Place order",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
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
