import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/satusrequst.dart';

import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/forgetpassword.dart/checkemail.dart';

abstract class ForgetPassword extends GetxController {
  checkemail();

  CheckemailD checkemailD = CheckemailD(Get.find());
}

class ForgetPasswordimp extends ForgetPassword {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequst? statusrequst;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusrequst = StatusRequst.loading;
      update();
      var respone = await checkemailD.postData(email.text);
      statusrequst == hadlingData(respone);
      if (StatusRequst.success == statusrequst) {
        if (respone['success'] == "success") {
          //Get.toNamed(AppRoute.verfiycode, arguments: email.text);
        } else {
          Get.defaultDialog(
            title: "Wornging",
            middleText: "Wornging",
          );
          StatusRequst.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
