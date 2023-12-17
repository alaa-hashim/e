// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/data.dart';
import 'package:ecommerce_app/model/shoping.dart';
import 'package:get/get.dart';

import '../../core/class/handledata.dart';
import '../../core/class/satusrequst.dart';
import '../../core/services/services.dart';

class ViewAddressController extends GetxController {
  
  Myservices myservices = Get.put(Myservices());
  Homedata homedata = Homedata(Get.find());
  Shoping shoping = Shoping(
      category: [],
      product: [],
      slider: [],
      subcategory: [],
      images: [],
      order: [],
      address: [],
      wishlist: [],
      orderdeltils: []);

  List data = [];

  late StatusRequst statusrequst;
  getaddress() async {
    data.clear();
    statusrequst = StatusRequst.loading;
    var response = await homedata.getData(
        "7", {"userid": myservices.sharedpreferences.getString("id")!});
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['success'] == true) {
        shoping=Shoping.fromJson(response);
        data.addAll(shoping.address);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  goToaddAddress() {
    Get.toNamed(AppRoute.addressmap);
  }

  goBack() {
    Get.back();
  }

  @override
  void onInit() {
    
    getaddress();
    super.onInit();
  }
}
