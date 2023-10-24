import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'package:lottie/lottie.dart';
import '../../core/constant/imageasset.dart';
import '../widget/bottomnavbar.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
        type: Transition.fade,
        curve: Curves.bounceIn,
        navigator: const Bottomnavbar(),
        backgroundColor: AppColor.green,
        durationInSeconds: 5,
        child: Padding(
          padding: const EdgeInsets.only(top: 65.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your Splash",
                  style: TextStyle(color: AppColor.white),
                ),
              ),
              Center(
                child: Lottie.asset(
                  AppImageAsset.success,
                ),
              ),
            ],
          ),
        ));
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.green,
          child: Lottie.asset(
            AppImageAsset.success,
          ),
        ),
      ],
    );
  }
}
