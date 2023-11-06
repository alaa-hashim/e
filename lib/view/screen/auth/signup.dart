// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/Sign_up_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/appexit.dart';
import '../../../core/functions/validater.dart';

import '../../widget/auth/signup&login.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerimp controller = Get.put(SignUpControllerimp());
    return Scaffold(
        backgroundColor: AppColor.bg,
        body: WillPopScope(
          onWillPop: appExit,
          child: GetBuilder<SignUpControllerimp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            "103".tr,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                return inputvalidater(val!, 1, 30, "");
                              },
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: '20'.tr,
                                  hintText: '23'.tr),
                              controller: controller.username,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                return inputvalidater(val!, 1, 30, "");
                              },
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: '18'.tr,
                                  hintText: '12'.tr),
                              controller: controller.email,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                return inputvalidater(val!, 1, 30, "");
                              },
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: '21'.tr,
                                  hintText: '22'.tr),
                              controller: controller.phone,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                return inputvalidater(val!, 1, 30, "");
                              },
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: '19'.tr,
                                  hintText: '13'.tr),
                              controller: controller.password,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 230,
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {
                                  Future.delayed(Duration.zero, () {
                                    controller.signup();
                                  });
                                },
                                textColor: AppColor.white,
                                child:  Text("17".tr),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SignupButton(
                              onTap: () {
                                controller.goToLogin();
                              },
                              textone: '25'.tr,
                              texttwo: '26'.tr,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColor.lightgray,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Coutnue with Accounts ",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.lightred,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 150,
                                  height: 55,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    textColor: AppColor.red,
                                    child: const Text("GOOGLE"),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.lightblue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 150,
                                  height: 55,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    textColor: AppColor.blue,
                                    child: const Text("FACEBOOK"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))),
          ),
        ));
  }
}
