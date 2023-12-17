import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboardingcontroller.dart';
import '../../core/constant/appcolor.dart';
import '../widget/auth/dotcontroller.dart';
import '../widget/custombutton.dart';
import '../widget/customslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboatdingcontrollerimp());
    return const Scaffold(
        backgroundColor: AppColor.bg,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
