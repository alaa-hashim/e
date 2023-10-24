// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/appcolor.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';

class Lang extends GetView<LocaleController> {
  const Lang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Text("1".tr),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 150,
                height: 55,
                child: MaterialButton(
                  hoverColor: AppColor.pink,
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.offNamed(AppRoute.onboadring);
                  },
                  color: AppColor.primaryColor,
                  textColor: AppColor.white,
                  child: const Text("ar"),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: 150,
              height: 55,
              child: MaterialButton(
                hoverColor: AppColor.pink,
                onPressed: () {
                  controller.changeLang("en");
                  Get.offNamed(AppRoute.onboadring);
                },
                color: AppColor.primaryColor,
                textColor: AppColor.white,
                child: const Text("en"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
