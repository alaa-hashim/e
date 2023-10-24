import 'package:get/get.dart';

import '../../../core/class/satusrequst.dart';

import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/forgetpassword.dart/virfycode.dart';

abstract class VerifyController extends GetxController {
  checkCode();
  goToreset(String virfycode);
}

class VerifyControllerimp extends VerifyController {
  String? email;
  VerfiycodeFP verfiycodeFP = VerfiycodeFP(Get.find());
  StatusRequst? statusrequst;
  @override
  checkCode() {}

  @override
  goToreset(virfycode) async {
    statusrequst = StatusRequst.loading;
    update();
    var respone = await verfiycodeFP.postData(email!, virfycode);
    statusrequst = hadlingData(respone);
    if (StatusRequst.success == statusrequst) {
      if (respone['status'] == "success") {
        //Get.toNamed(AppRoute.resetpassword, arguments: 'email');
      } else {
        Get.defaultDialog(title: "Wornging", middleText: "virfycode is wrong");
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
