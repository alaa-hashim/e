import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/forgetpassword_controller.dart';

import '../../../../core/constant/appcolor.dart';
import '../../../../core/functions/validater.dart';
import '../../../widget/auth/custmauth.dart';

class ForgetPasswordscreen extends StatelessWidget {
  const ForgetPasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordimp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bg,
        elevation: 0.0,
        title: Text('14'.tr,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColor.darkgray)),
      ),
      body: GetBuilder<ForgetPasswordimp>(
          builder: (controller) =>  
          
           HandlingDataView(
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
                          Text("27".tr,) ,
                          const SizedBox(height: 10),
                          Text("29".tr,) ,
                          
                          const SizedBox(height: 15),
                          CustomTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return inputvalidater(val!, 9, 30, "");
                            },
                            mycontroller: controller.email,
                            hinttext: "12".tr,
                            iconData: Icons.email_outlined,
                            labeltext: "18".tr,
                            // mycontroller: ,
                          ),
                          TextButton(onPressed: (){
                            controller.checkemail();
                          }, child:Text("30".tr,) )
                          ,
                          const SizedBox(height: 40),
                        ]),
                      ),
                    ),
             ),
           )),
    );
  }
}