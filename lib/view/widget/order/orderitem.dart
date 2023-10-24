// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/ordercontroller.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../links.dart';
import 'orderdetil.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return InkWell(
      child: Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.data.length,
            itemBuilder: (context, i) {
              return GetBuilder<OrderController>(
                builder: (controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Get.to(Orderdetial(
                      order: controller.data[i],
                    )),
                    child: Container(
                        height: 200,
                        width: double.infinity,
                        color: AppColor.blue,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Orderimag(
                              i: i,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text("#${controller.data[i].orderId}"),
                                  Text(controller.data[i].oderDate.toString()),
                                ]),
                                Row(children: [
                                  const Text("Status :"),
                                  Text(
                                    controller.orderStatus(
                                        controller.data[i].orderStatus),
                                    style: TextStyle(
                                      color:
                                          controller.data[i].orderStatus == "0"
                                              ? AppColor.red
                                              : AppColor.green,
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  const Text("order Price :"),
                                  Text(
                                    controller.data[i].orderPrice,
                                    style: TextStyle(
                                      color:
                                          controller.data[i].orderStatus == "0"
                                              ? AppColor.red
                                              : AppColor.green,
                                    ),
                                  )
                                ]),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Orderimag extends StatelessWidget {
  final int i;
  const Orderimag({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());

    // Filter controller.data1 based on the condition
    List<Cart> filteredItems = controller.data1
        .where((item) => item.cartOrder == controller.data[i].orderId)
        .toList();
    filteredItems = filteredItems.take(4).toList();

    return Container(
      height: 150,
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 0.20,
          childAspectRatio: 1.20,
        ),
        itemCount: filteredItems.length, // Use filtered data
        itemBuilder: (context, i) {
          return Container(
            child: Column(children: [
              Container(
                height: 70,
                width: double.infinity,
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
            ]),
          );
        },
      ),
    );
  }
}
