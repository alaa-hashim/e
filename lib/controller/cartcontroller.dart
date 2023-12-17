// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/model/coupon.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/services/services.dart';

import '../data/datasource/remote/cart.dart';
import '../model/cart.dart';

class Cartcontroller extends GetxController {
  CartData cartData = CartData(Get.find());

  Myservices myservices = Get.put(Myservices());

  late StatusRequst statusrequst;
  late String st;
  late String tt;
  late String td;
  late String dd;
  late String tg;
  late int itemcount;
  RxList<Cart> data = RxList<Cart>();
  RxInt quantity = RxInt(0);
  List total = [];
  int totalprice = 0;
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;
  Coupon? couponModel;
  TextEditingController? couponcode;

  double cartPrice = 0.0;
  int cartcount = 0;
  @override
  void onInit() {
    st = '6';
    tt = '7';
    td = '800';
    dd = '700';
    tg = '9';

    Map<String, dynamic>? arguments = Get.arguments;

    if (arguments != null) {
      itemcount = Get.arguments['itemcount'];
      print(itemcount);
    } else {
      // Handle the case where Get.arguments is null or does not contain the expected keys.
      // You can add error handling or default values here.
    }
    couponcode = TextEditingController();
    getCart();
    print(getTotal());

    super.onInit();
  }

  getCart() async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await cartData.viewData(
        st, myservices.sharedpreferences.getString("id")!);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        if (response['data']['status'] == 'success') {
          List dataresponse = response['data']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => Cart.fromJson(e)));
          cartcount = int.parse(dataresponsecountprice['totalcount']);
          cartPrice = double.parse(dataresponsecountprice['totalprice']);

          print(data.length);
        }
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  add(String itemsid) async {
    update();
    var response = await cartData.addQ(
      myservices.sharedpreferences.getString("id")!,
      itemsid,
      td,
    );
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        // data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }

    update();
  }

  delete(String itemsid) async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await cartData.removeQ(
        myservices.sharedpreferences.getString("id")!, itemsid, dd);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        getCart();
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  Future<void> deleteItem(String cartId) async {
    // Set a flag to indicate that an item removal is in progress

    statusrequst = StatusRequst.loading;
    update();

    var response = await cartData.deleteData(
      myservices.sharedpreferences.getString("id")!,
      cartId,
      tg,
    );

    print("=============================== Controller $response ");
    statusrequst = handlingData(response);

    if (StatusRequst.success == statusrequst) {
      if (response['status'] == "success") {
        // Find the index of the item to delete
        final index = data.indexWhere((item) => item.cartId == cartId);

        if (index != -1) {
          // Remove the item if the index is valid
          data.removeAt(index);
          print("Item removed at index: $index");

          // Update the UI
          update();
        } else {
          print("Item not found in the list.");
        }
      } else {
        statusrequst = StatusRequst.failure;
      }
    } else {
      print("Error: Failed to delete item from the cart.");
    }

    update();
  }

  getcount(String itemsid) async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await cartData.getcountData(
        myservices.sharedpreferences.getString("id")!, itemsid, tg);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        // data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  getTotal() {
    return cartPrice - cartPrice * discountcoupon! / 100;
  }

  checkcoupon() async {
    statusrequst = StatusRequst.loading;
    update();

    var response = await cartData.coupon(couponcode!.text);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = Coupon.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Warning", "Coupon Not Valid");
      }
      // End
    }
    update();
  }

  goTocheckout() {
    Get.toNamed(AppRoute.checkout, arguments: {
      "discountcoupon": discountcoupon,
      "couponid": couponid ?? "0 ",
      "cartPrice": cartPrice,
    });
  }

  void clearData() {
    // Clear the data
    discountcoupon = 0;
    couponname = null;
    couponid = null;
    // You might want to clear other relevant data as well

    // Update the UI
    update();
  }
}