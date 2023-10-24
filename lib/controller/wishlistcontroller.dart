// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../data/datasource/remote/wishlist.dart';

class WishlistController extends GetxController {
  late String st;
  late String ts;
  late String tv;

  RxList data = RxList();
  Myservices myservices = Get.put(Myservices());
  WishData wishData = WishData(Get.find());
  bool isDataLoaded = false;

  late StatusRequst statusrequst;
  Map isWished = {};
  setWished(id, val) {
    isWished[id] = val;
    update();
  }

  @override
  void onInit() {
    st = '12';
    ts = '13';
    tv = '14';

    view(); // Load data only if it hasn't been loaded before

    super.onInit();
  }

  bool isItemInWishlist(String itemId) {
    return isWished.containsKey(itemId) && isWished[itemId];
  }

  addwish(itemId) async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await wishData.addData(
      itemId.toString(),
      st,
      myservices.sharedpreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  deletewish(itemId) async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await wishData.deleteData(
      itemId,
      ts,
      myservices.sharedpreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  view() async {
    statusrequst = StatusRequst.loading;
    update();

    // Fetch the data from the server
    var response = await wishData.viewData(
      tv,
      myservices.sharedpreferences.getString("id")!,
    );

    print("=============================== Controller $response ");
    statusrequst = handlingData(response);

    if (StatusRequst.success == statusrequst) {
      // Clear existing data before adding new data
      data.clear();

      // Add the new data to the list
      data.addAll(response['data']);
    } else {
      statusrequst = StatusRequst.failure;
    }

    update();
  }
}
