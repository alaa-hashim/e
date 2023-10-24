// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/constant/routes.dart';
import '../data/datasource/remote/items.dart';
import '../model/product.dart';

abstract class Recommendedcontroller extends GetxController {
  intialData();

  getItems(String itemId);
  goToPageProductDetails(Product prodUct);
}

class Recommendedcontrollermpl extends Recommendedcontroller {
  String? itemId;
  late String st;
  late String selectedCat;

  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequst statusrequst;

  // MyServices myServices = Get.find();

  @override
  void onInit() {
    // search = TextEditingController();
    intialData();
    st = '30';
    super.onInit();
  }

  @override
  intialData() {
    selectedCat = Get.arguments['selectedcat'];
    itemId = Get.arguments['categoryId'];
    getItems(itemId!);
  }

  @override
  getItems(itemId) async {
    data.clear();
    statusrequst = StatusRequst.loading;
    var response = await testData.getRecommned(itemId, st, selectedCat);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['recommend']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  @override
  goToPageProductDetails(prodUct) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      "product": prodUct,
    });
  }
}
