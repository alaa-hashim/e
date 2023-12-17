// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/links.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../controller/cartcontroller.dart';
import '../../../core/class/satusrequst.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translatedata.dart';

class Carttems extends StatelessWidget {
  const Carttems({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller controller = Get.put(Cartcontroller());
    return Container(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.data.length,
        itemBuilder: (context, i) {
          return Obx(
            () => Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Container(
                height: 170,
                color: AppColor.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl:
                                  "${AppLink.imagestItems}/${controller.data[i].proudctImg}",
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                translateDatabase(
                                  controller.data[i].proudctNamear,
                                  controller.data[i].productName,
                                ),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Obx(
                                () => Text(
                                  // conignore: unrelated_type_equality_checks
                                  controller.data[i].itemsprice,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () async {
                                try {
                                  if (controller.data.isNotEmpty &&
                                      i >= 0 &&
                                      i < controller.data.length) {
                                    if (controller.statusrequst ==
                                        StatusRequst.loading) {
                                      return;
                                    }
                                    await controller
                                        .deleteItem(controller.data[i].cartId);
                                  }
                                } catch (e) {
                                  // Handle the error here.
                                }
                              },
                              icon: controller.statusrequst ==
                                          StatusRequst.loading ||
                                      i >= controller.data.length
                                  ? const CircularProgressIndicator()
                                  : const Icon(
                                      Icons.delete_outlined,
                                      size: 35,
                                    ),
                            ))
                      ],
                    )),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.add(
                                controller.data[i].productId,
                              );
                              // No need to call
                              // controller.refreshPage();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.plus,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColor.darkgray,
                              ),
                            ),
                            child: Center(
                              child: Obx(
                                () => HandlingDataView(
                                  statusRequest: controller.statusrequst,
                                  widget: Text(
                                    controller.data[i].quantity.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.delete(
                                controller.data[i].productId,
                              );
                              // No need to call
                              // controller.refreshPage();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.minus,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}