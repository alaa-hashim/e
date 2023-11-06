// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/controller/checkoutcontroller.dart';

import '../../../core/class/handlindatview.dart';

// ignore: must_be_immutable
class Choiceaddress extends StatelessWidget {
  bool isActive;
  Choiceaddress({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.find();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 99,
          decoration: BoxDecoration(
              border: Border.all(
                color: isActive ? AppColor.blue : AppColor.green,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: ListView(shrinkWrap: true, children: [
            GetBuilder<CheckoutController>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusrequst,
                      widget: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                controller.choiceaddress(
                                    controller.data[i].addressId);
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${controller.data[i].city} , ${controller.data[i].street} , ${controller.data[i].building}  , ${controller.data[i].apartment}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                           Text(
                                            "62".tr,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${controller.data[i].adressPhone} ",
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ))
          ]),
        ));
  }
}

class Checkoutaddress extends StatelessWidget {
  final String tital;
  final bool isActive;
  final IconData icon;

  const Checkoutaddress(
      {super.key,
      required this.tital,
      required this.isActive,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
              color: isActive == true ? AppColor.primaryColor : AppColor.white,
            ),
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                  color:
                      isActive == true ? AppColor.primaryColor : AppColor.black,
                  icon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tital,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isActive == true
                        ? AppColor.primaryColor
                        : AppColor.black),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
