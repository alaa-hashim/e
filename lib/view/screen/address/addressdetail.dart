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
                child: const Text(
                  "Add New Address",
                  style: TextStyle(fontSize: 20, color: AppColor.white),
                ),
                onPressed: () {
                  controller.addAddress();
                })),
        appBar: AppBar(
          title: const Text("Add New Address"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: 'Enter  Address Name'),
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'City',
                          hintText: 'city'),
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Street',
                          hintText: 'street'),
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter  Address Name'),
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter  Address Name'),
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                          hintText: 'Enter  Youer Phone '),
                    ),
                  ),
                  const Text(" Address lebel "),
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
                          tital: 'Home',
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
                          tital: 'office',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
