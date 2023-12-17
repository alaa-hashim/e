// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../data/datasource/remote/data.dart';
import '../data/datasource/remote/wishlist.dart';
import '../model/shoping.dart';

class WishlistController extends GetxController {
  late String st;
  late String ts;
  late String tv;

  RxList data = RxList();
  Myservices myservices = Get.put(Myservices());
  WishData wishData = WishData(Get.find());
     Homedata homedata = Homedata(Get.find());
       Shoping shoping=Shoping(category: [], product: [], slider: [], subcategory: [], images: [], order: [], address: [], wishlist: [], orderdeltils: []);


  bool isDataLoaded = false;

  late StatusRequst statusrequst;
  Map isWished = {};
  setWished(id, val) {
    isWished[id] = val;
    update();
  }

  @override
  void onInit() {
    
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
  var response = await homedata.getData("5", {"userid": myservices.sharedpreferences.getString("id")!});

  print("=============================== Controller $response ");
  statusrequst = handlingData(response);

  if (StatusRequst.success == statusrequst) {
    data.clear();
    update();

    if (response['success'] == true) {
      shoping=Shoping.fromJson(response);
      data.addAll(shoping.wishlist);
      print("${data.length}xxx");
    } else {
      // Handle the case when success is false
    }
  } else {
    statusrequst = StatusRequst.failure;
  }

  update();
}

}
