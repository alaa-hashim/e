import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen) {
  Myservices myServices = Get.find();
  if (myServices.sharedpreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
