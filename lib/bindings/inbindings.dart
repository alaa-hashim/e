import 'package:get/get.dart';

import '../core/class/apihandler.dart';

class Inibindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiHandler());
  }
}
