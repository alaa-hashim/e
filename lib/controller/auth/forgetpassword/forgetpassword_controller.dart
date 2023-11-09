import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/satusrequst.dart';

import '../../../core/constant/routes.dart';

import '../../../data/datasource/remote/forgetpassword.dart/checkemail.dart';


abstract class ForgetPassword extends GetxController {
  checkemail();

  CheckemailD checkemailD = CheckemailD(Get.find());
}

class ForgetPasswordimp extends ForgetPassword {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  
    StatusRequst statusRequst = StatusRequst.none;
   String st = '61';
@override
checkemail() async {
  if (formstate.currentState!.validate()) {
    statusRequst = StatusRequst.loading;
    update();
    var response = await checkemailD.getemail(email.text, st);
    
    if (response['status'] == "success") {
      Get.toNamed(AppRoute.verfiycode, arguments:{"email": email.text});
    } else {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Something went wrong",
      );
      statusRequst = StatusRequst.failure; // Update the status to failure
    }
    
    update();
  }
}


  @override
  void onInit() {
    st = '61';
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
