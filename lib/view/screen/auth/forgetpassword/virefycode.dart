import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/verfiycode_controller.dart';
import '../../../../core/constant/appcolor.dart';

class VerfiyCodescreen extends StatelessWidget {
  const VerfiyCodescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyControllerimp controller =
        Get.put(VerifyControllerimp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bg,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColor.darkgray)),
      ),
      body: HandlingDataView(
        statusRequest: controller.statusrequst,
        widget: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(children: [
              const SizedBox(height: 20),
              const Text( "Check code"),
              const SizedBox(height: 10),
               Text(
                  
                      "Please Enter The Digit Code Sent To your ${controller.email}"),
              const SizedBox(height: 15),
                OtpTextField(
                  
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor:const  Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                         controller.goToreset(verificationCode) ; 
                    }, // end onSubmit
                  ), 
              const SizedBox(height: 40),
            ]),
          ),
        ),
      ),
    );
  }
}