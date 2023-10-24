// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:ecommerce_app/core/class/satusrequst.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';

import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/handledata.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/addresses.dart';

class Addressdetailcontroller extends GetxController {
  AddressData addresdata = AddressData(Get.find());
  late StatusRequst statusrequst = StatusRequst.none;
  Myservices service = Get.put(Myservices());

  String? st;
  String? lat;
  String? long;
  Uint8List? image;
  RxString? address;
  String? defaultAddress;
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController apartment = TextEditingController();
  TextEditingController phone = TextEditingController();

  choiceAddress(String val) {
    defaultAddress = val;
    print(defaultAddress);
    update();
  }

  addAddress() async {
    statusrequst = StatusRequst.loading;
    update();

    var response = await addresdata.addData(
      st!,
      service.sharedpreferences.getString("id")!,
      name.text,
      city.text,
      street.text,
      building.text,
      apartment.text,
      phone.text,
      long!,
      lat!,
      defaultAddress!,
      address.toString(),
    );

    print("=============================== Controller $response ");

    statusrequst = handlingData(response);

    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.viewaddress);
        Get.snackbar('Address', 'Address added successfully ',
            colorText: AppColor.white, backgroundColor: AppColor.green);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }

    // Update the UI again after processing
    update();
  }

  intialData() {
    st = '200';
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    image = Get.arguments['image'];
    address = Get.arguments['selectedAddress'];

    print(lat);
    print(long);
    print(image);
    print(address);
    print(defaultAddress);

    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    apartment = TextEditingController();
    phone = TextEditingController();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
