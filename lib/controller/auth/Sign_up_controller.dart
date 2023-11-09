// ignore_for_file: file_names, avoid_print, unused_import

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handledata.dart';
import '../../core/class/satusrequst.dart';
import '../../core/constant/appcolor.dart';
import '../../core/constant/routes.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  var isLoading = true.obs;
  signup();
  goToLogin();

  Myservices myServices = Get.find();
}

class SignUpControllerimp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  String? token;
  late String st;
  StatusRequst statusRequest = StatusRequst.none;

  SignData signupData = SignData(Get.find());

  List data = [];

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequst.loading;
      update();
      var response = await signupData.postdata(
          st, email.text, password.text, username.text, phone.text, token!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequst.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
           Get.snackbar('104'.tr,
            "105".tr,
            backgroundColor: AppColor.green,
            colorText: AppColor.white,
            duration: const Duration(seconds: 4));
          Get.offNamed(AppRoute.login, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "69".tr,
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequst.failure;
        }
      }
      update();
    } else {}
  }

  Future<void> saveTokenToDatabase(String token) async {
    // Save the token to a common location in the database
    await FirebaseFirestore.instance.collection('tokens').add({
      'token': token,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> setupToken() async {
    // Get the token each time the application loads
    token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      // Print the token to the console
      print('FCM Token: $token');

      // Save the token to the database
      await saveTokenToDatabase(token!);
    }

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
    setupToken();
    st = '5';
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
