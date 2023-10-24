import 'package:get/get.dart';

import '../services/services.dart';

translateDatabase(columnar, columnen) {
  Myservices myServices = Get.find();

  if (myServices.sharedpreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
