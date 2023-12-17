// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart.dart';
import '../model/product.dart';

abstract class ProductDetailcontroller extends GetxController {}

class ProductDetailmpl extends ProductDetailcontroller {
  intialData() async {
    statusrequst = StatusRequst.loading;
    // await getCountItems(prodUct.productId!);
    statusrequst = StatusRequst.success;
    update();
  }

   Product? prodUct;
  CartData cartData = CartData(Get.find());

  Myservices myservices = Get.put(Myservices());

  late StatusRequst statusrequst;
  late String st;
  late String tt;
  late String tg;
  late int itemcount = 1;
  @override
  void onInit() {
    prodUct = Get.arguments['product'];
    st = '1';
    tt = '9';
    tg = '88';
    intialData();
    super.onInit();
  }

  goBack() {
    Get.back();
  }
  gtTocart() {
    Get.toNamed(AppRoute.cart, arguments: {
      "itemcount": itemcount,
    });
  }
  addItems(String itemsid) async {
    update();
    var response = await cartData.addData(
        myservices.sharedpreferences.getString("id")!,
        itemsid,
        st,
        itemcount.toString());
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        Get.bottomSheet(Container(
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          height: 230,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Lottie.asset(
                      AppImageAsset.success,
                      width: 45,
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                            translateDatabase(
                              prodUct!.proudctNamear,
                              prodUct!.productName!.length > 20
                                  ? '${prodUct!.productName!.substring(0, 20)}..'
                                  : prodUct!.productName,
                            ),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800)),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Added to Cart ",
                      style: TextStyle(
                          color: AppColor.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("COUNTINUE SHOPPING ",
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w800))),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.cart, arguments: {
      "itemcount": itemcount,
    });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Center(
                      child: Text("VIEW CART",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
        // data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  deleteitems(String itemsid) async {
    update();

    var response = await cartData.removeQ(
        myservices.sharedpreferences.getString("id")!, itemsid, tt);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  getCountItems() async {
    statusrequst = StatusRequst.loading;
    var response = await cartData.viewData(
        myservices.sharedpreferences.getString("id")!, tg);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
  }



  add() {
    itemcount++;
    //  addItems(prodUct.productId!);
    update();
  }

  remove() {
    if (itemcount > 1) {
      // deleteitems(prodUct.productId!);
      itemcount--;
    }
    update();
  }
}
