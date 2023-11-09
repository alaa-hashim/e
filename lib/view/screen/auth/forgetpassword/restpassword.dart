import 'package:ecommerce_app/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce_app/view/widget/auth/custmauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlindatview.dart';
import '../../../../core/constant/appcolor.dart';
import '../../../../core/functions/validater.dart';

class ResetPasswordscreen extends StatelessWidget {
  const ResetPasswordscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswrodControllerimp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bg,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ),
      ),
      body: GetBuilder<ResetPasswrodControllerimp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequst,
              widget: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      Text( "35".tr),
                      const SizedBox(height: 10),
                      Text( "35".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
               return inputvalidater(val!, 9, 30, "");                      },
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
              
                        valid: (val) {
               return inputvalidater(val!, 9, 30, "");                      },
                        mycontroller: controller.repassword,
                        hinttext: "Re ${"13".tr}",
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      TextButton(onPressed: () {
                            controller.goToLogin();
                          }, child: Text("33".tr,)),
                      
                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
              ))),
    );
  }
}