// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  Myservices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedpreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.bottomNavigationBar);
    }
    if (myServices.sharedpreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
