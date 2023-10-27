// ignore_for_file: file_names, unused_local_variable

import 'package:ecommerce_app/controller/homecontroller.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/view/widget/appbar.dart';
import 'package:ecommerce_app/view/widget/home/discount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/features.dart';
import '../widget/home/homecategory.dart';
import '../widget/home/item&subcat.dart';
import '../widget/home/slider.dart';
import '../widget/home/srearchitem.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllermpl controller = Get.put(HomeControllermpl());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bg,
        appBar:
            buildAppBar(context), // Call the method to build the custom AppBar
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: AppColor.bg,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: GetBuilder<HomeControllermpl>(
            builder: (controller) => ListView(
              shrinkWrap: true,
              children: [
                HandlingDataView(
                  statusRequest: controller.statusrequst,
                  widget: controller.isSearch
                      ? SearchItem(
                          listdatamodel: controller.listdata,
                        )
                      : Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Homesliders(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Category",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                            const Homecategory(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sale Discount",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ),
                            const Discount(),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: controller.views.length > 5
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("43".tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                        ],
                                      )
                                    : null),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: controller.views.length > 5
                                  ? const Features()
                                  : null,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SubcatandItem(),
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
