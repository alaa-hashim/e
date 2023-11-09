import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/satusrequst.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/forgetpassword.dart/resetpasswoed.dart';

abstract class ResetPasswrodController extends GetxController {
  resetpass();
  goToLogin();
}

class ResetPasswrodControllerimp extends ResetPasswrodController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPassword resetpasswordf = ResetPassword(Get.find());
  StatusRequst statusRequst = StatusRequst.none;
  String? email;
  late TextEditingController password;
  late TextEditingController repassword;
String st = '63';
  @override
  goToLogin() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Wornging", middleText: "password dnot match");
    }

    if (formstate.currentState!.validate()) {
      statusRequst = StatusRequst.loading;
      update();
      var respone = await resetpasswordf.postData(email!, password.text , st);
      statusRequst = hadlingData(respone);
      if (StatusRequst.success == statusRequst) {
        if (respone['status'] == "success") {
          Get.snackbar('Success', 'your password has been updated successfully',
          duration: const Duration(seconds: 2) ,colorText: AppColor.white, backgroundColor: AppColor.green);
          Get.offAllNamed(AppRoute.login);
        } else {
          Get.defaultDialog(
              title: "Wornging", middleText: "password dnot match");
          statusRequst = StatusRequst.failure;
        }
      }
    }
  }

  @override
  void onInit() {
   email= Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  resetpass() {}
}
