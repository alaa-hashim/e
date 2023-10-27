// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/homedata.dart';

class SettingsController extends GetxController {
  Myservices myServices = Get.find();
  var statusrequst = StatusRequst.none;
  GlobalKey<FormState> editstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  List data = [];
  Homedata homedata = Homedata(Get.find());
  late String st;
  late String tt;

  logout() {
    statusrequst = StatusRequst.loading;
    String userid = myServices.sharedpreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedpreferences.clear();
    Get.offAllNamed(AppRoute.login);
    statusrequst = StatusRequst.none;
  }

  Future<void> getData() async {
    statusrequst = StatusRequst.loading;

    var response = await homedata.viewData(
        st, myServices.sharedpreferences.getString("id")!);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  edit() async {
    if (editstate.currentState!.validate()) {
      statusrequst = StatusRequst.loading;
      update();
      var response = await homedata.editData(
        tt,
        myServices.sharedpreferences.getString("id")!,
        email.text,
        username.text,
        phone.text,
      );
      print("=============================== Controller $response ");
      statusrequst = handlingData(response);
      if (StatusRequst.success == statusrequst) {
        if (response['status'] == "success") {
          myServices.sharedpreferences
              .setString("email", response['data']['email']);
          myServices.sharedpreferences
              .setString("username", response['data']['user']);
          Get.back(); // data.addAll(response['data']);
          Get.snackbar(
              duration: const Duration(seconds: 2),
              'Success',
              " You have successfully",
              colorText: AppColor.white,
              backgroundColor: AppColor.green);
        } else {
          statusrequst = StatusRequst.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    st = '50';
    tt = '51';
    getData();

    super.onInit();
  }
}
