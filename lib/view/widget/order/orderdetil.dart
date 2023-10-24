// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/localization/translatedatabase.dart';
import 'package:ecommerce_app/model/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ordercontroller.dart';
import '../../../links.dart';
import '../../../model/cart.dart';

class Orderdetial extends StatelessWidget {
  final Order order;
  const Orderdetial({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    List<Cart> filteredItems = controller.data1
        .where((item) => item.cartOrder == order.orderId)
        .toList();

    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        title: Center(
          child: Text(
            "#${order.orderId}",
            style: const TextStyle(color: AppColor.black),
          ),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Container(
            height: 90,
            color: AppColor.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: EasyStepper(
                activeStep: int.parse(order.orderStatus),
                activeStepTextColor: Colors.black87,
                finishedStepTextColor: Colors.black87,
                internalPadding: 0,
                showLoadingAnimation: true,
                stepRadius: 8,
                showStepBorder: true,
                lineStyle: const LineStyle(
                    lineSpace: 0,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.black,
                    finishedLineColor: Colors.green,
                    lineThickness: 2),
                steps: [
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: int.parse(order.orderStatus) >= 0
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    title: 'Waiting',
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: int.parse(order.orderStatus) >= 1
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    title: 'Received',
                    topTitle: true,
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: int.parse(order.orderStatus) >= 2
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    title: 'Preparing',
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: int.parse(order.orderStatus) >= 3
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    title: 'On Way',
                    topTitle: true,
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: int.parse(order.orderStatus) >= 4
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    title: 'Delivered',
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredItems.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: AppColor.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl:
                                "${AppLink.imagestItems}/${filteredItems[i].proudctImg}",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translateDatabase(
                                filteredItems[i].proudctNamear,
                                filteredItems[i].productName)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("42".tr),
                                Text(filteredItems[i].itemsprice)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
