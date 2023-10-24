// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/class/handledata.dart';
import '../../core/class/satusrequst.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/addresses.dart';

class ViewAddressController extends GetxController {
  late String st;
  Myservices myservices = Get.put(Myservices());
  AddressData adresData = AddressData(Get.find());

  List data = [];

  late StatusRequst statusrequst;
  getaddress() async {
    data.clear();
    statusrequst = StatusRequst.loading;
    var response = await adresData.viewData(
        st, myservices.sharedpreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  goToaddAddress() {
    Get.offAllNamed(AppRoute.addressmap);
  }

  goBack() {
    Get.back();
  }

  @override
  void onInit() {
    st = '17';
    getaddress();
    super.onInit();
  }
}
