import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ordercontroller.dart';
import '../widget/order/orderitem.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Center(
          child: Text(
            "My Orders ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: GetBuilder<OrderController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusrequst,
          widget:
              ListView(physics: const BouncingScrollPhysics(), children: const [
            OrderItem(),
          ]),
        ),
      ),
    );
  }
}
