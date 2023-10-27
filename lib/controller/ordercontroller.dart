// ignore_for_file: avoid_print

import 'package:ecommerce_app/model/cart.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/homedata.dart';
import '../model/order.dart';

class OrderController extends GetxController {
  Homedata cartData = Homedata(Get.find());

  Myservices myservices = Get.put(Myservices());

  late StatusRequst statusrequst;
  late String st;
  late String tt;
  RxList<Order> data = RxList<Order>();
  RxList<Cart> data1 = RxList<Cart>();
  String orderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up ";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getorders(String st) async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await cartData.viewData(
        st, myservices.sharedpreferences.getString("id")!);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        List dataresponse = response['data'];

        data.clear();
        data.addAll(dataresponse.map((e) => Order.fromJson(e)));

        print(data.length);
      } else {}
    }
    update();
  }

  ordersdetil() async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await cartData.viewData(
        tt, myservices.sharedpreferences.getString("id")!);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        List dataresponse = response['data'];

        data1.clear();
        data1.addAll(dataresponse.map((e) => Cart.fromJson(e)));

        print(data.length);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    st = '57';
    tt = '56';
    getorders(st);
    ordersdetil();
    super.onInit();
  }
}
