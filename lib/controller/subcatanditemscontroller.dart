// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/homedata.dart';
import '../model/product.dart';
import '../model/subcategory.dart';

class SubcatandItemscontroller extends GetxController{
  Homedata cartData = Homedata(Get.find());

  Myservices myservices = Get.put(Myservices());

  late StatusRequst statusrequst;
  late String st;
  late String tt;
  RxList<Subcategories> data = RxList<Subcategories>();
  RxList<Product> data1 = RxList<Product>();
    getsubcat() async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await cartData.viewData(
        st, myservices.sharedpreferences.getString("id")!);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        List dataresponse = response['data'];

        data.clear();
        data.addAll(dataresponse.map((e) => Subcategories.fromJson(e)));

        print(data.length);
      } else {}
    }
    update();
  }

  getitems() async {
    statusrequst = StatusRequst.loading;
    data1.clear();
    update();
    var response = await cartData.viewitems(
        tt, myservices.sharedpreferences.getString("id")!);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        List dataresponse = response['data'];

        data1.clear();
        data1.addAll(dataresponse.map((e) => Product.fromJson(e)));

        print("${data.length}itemsss");
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    st = '250';
 tt = '190';
 getsubcat();
 getitems();
    super.onInit();
  }
}