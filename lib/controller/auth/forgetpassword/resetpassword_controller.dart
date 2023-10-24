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
  StatusRequst? statusrequst;
  String? email;
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  goToLogin() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Wornging", middleText: "password dnot match");
    }

    if (formstate.currentState!.validate()) {
      statusrequst = StatusRequst.loading;
      update();
      var respone = await resetpasswordf.postData(email!, password.text);
      statusrequst = hadlingData(respone);
      if (StatusRequst.success == statusrequst) {
        if (respone['status'] == "success") {
          Get.toNamed(AppRoute.login);
        } else {
          Get.defaultDialog(
              title: "Wornging", middleText: "password dnot match");
          statusrequst = StatusRequst.failure;
        }
      }
    }
  }

  @override
  void onInit() {
    Get.arguments['email'];
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
