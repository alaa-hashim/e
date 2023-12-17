// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/address/viewaddresscontroller.dart';
import '../../../model/address.dart';

class Viewaddresses extends StatelessWidget {
  const Viewaddresses({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
        backgroundColor: AppColor.bg,
        bottomNavigationBar: Container(
            height: 55,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColor.blue),
            child: TextButton(
                child: Text(
                  "90".tr,
                  style: const TextStyle(fontSize: 20, color: AppColor.white),
                ),
                onPressed: () {
                  controller.goToaddAddress();
                })),
        appBar: AppBar(
            leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.black,
                size: 25,
              ),
            ),
            title: Center(
              child: Text(
                "91".tr,
                style: const TextStyle(color: AppColor.black),
              ),
            )),
        body: controller.data.isEmpty
            ? ListView(shrinkWrap: true, children: [
                GetBuilder<ViewAddressController>(
                    builder: (controller) => HandlingDataRequest(
                          statusRequest: controller.statusrequst,
                          widget: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.shoping.address.length,
                              itemBuilder: (context, i) {
                                return AddressItem(
                                    address: controller.shoping.address[i]);
                              }),
                        ))
              ])
            : Center(
                child: Column(children: [
                  Text("77".tr),
                  Lottie.asset(AppImageAsset.noImage)
                ]),
              ));
  }
}

class AddressItem extends StatelessWidget {
  Address address;
  AddressItem({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        color: AppColor.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: FaIcon(
                        address.addressType == 1
                            ? FontAwesomeIcons.building
                            : FontAwesomeIcons.house,
                        size: 15,
                      ),
                    ),
                    Text(address.addressName,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.pen,
                        size: 14,
                        color: AppColor.darkgray,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: Text(
                          "61".tr,
                          style: const TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("91".tr, style: Theme.of(context).textTheme.titleMedium),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "${address.city} ${address.street} ${address.building} ${address.apartment}",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("62".tr, style: Theme.of(context).textTheme.titleMedium),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${address.adressPhone} ",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
