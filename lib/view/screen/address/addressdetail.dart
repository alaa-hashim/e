// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressdetail.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/validater.dart';
import '../../widget/address/choiceaddress.dart';

class Addressdetail extends StatelessWidget {
  const Addressdetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Addressdetailcontroller controller = Get.put(Addressdetailcontroller());
    return Scaffold(
        bottomNavigationBar: Container(
            height: 55,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColor.blue),
            child: TextButton(
                child:  Text(
                  "90".tr,
                  style: const TextStyle(fontSize: 20, color: AppColor.white),
                ),
                onPressed: () {
                  controller.addAddress();
                })),
        appBar: AppBar(
          title:  Text("90".tr),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: InkWell(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<Addressdetailcontroller>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusrequst,
                widget: ListView(
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.memory(
                        controller.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      controller.address.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: controller.name,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return inputvalidater(val!, 1, 30, "");
                        },
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))

                            ),
                            labelText: '91'.tr,
                            hintText: '92'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: controller.city,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return inputvalidater(val!, 1, 30, "");
                        },
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            labelText: '93'.tr,
                            hintText: '93'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: controller.street,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return inputvalidater(val!, 1, 30, "");
                        },
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            labelText: '94'.tr,
                            hintText: '94'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: controller.building,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return inputvalidater(val!, 1, 30, "");
                        },
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            labelText: '95'.tr,
                            hintText: '95'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: controller.apartment,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return inputvalidater(val!, 1, 30, "");
                        },
                        decoration:   InputDecoration(
                            border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            labelText: '96'.tr,
                            hintText: '96'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: controller.phone,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return inputvalidater(val!, 1, 30, "");
                        },
                        decoration:   InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            labelText: '97'.tr,
                            hintText: '97'.tr),
                      ),
                    ),
                     Text("98".tr),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.choiceAddress("0");
                          },
                          child: Defaultaddrss(
                            icon: FontAwesomeIcons.house,
                            isActive:
                                controller.defaultAddress == "0" ? true : false,
                            tital: '99'.tr,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.choiceAddress("1");
                          },
                          child: Defaultaddrss(
                            icon: FontAwesomeIcons.building,
                            isActive:
                                controller.defaultAddress == "1" ? true : false,
                            tital: '100'.tr,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
