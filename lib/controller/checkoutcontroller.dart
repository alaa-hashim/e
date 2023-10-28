// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../data/datasource/checkout.dart';
import '../data/datasource/remote/addresses.dart';
import '../model/address.dart';

class CheckoutController extends GetxController {
  String? paymentmetheod;
  int? discountcoupon;
  String? couponid;
  double? cartPrice;
  int shopfee = 10;
  int paymentfee = 12;
  late String st;
  late String tt;
  Address? address;
  String? defalutAddress = "0";
  Myservices myservices = Get.put(Myservices());
  AddressData adresData = AddressData(Get.find());
  CheckuotData checkuotData = CheckuotData(Get.find());

  List<Address> data = [];

  late StatusRequst statusrequst;
  totalorder() {
    return (cartPrice ?? 0).toInt() + shopfee + paymentfee;
  }

  choiceaddress(String val) {
    defalutAddress = val;
    update();
    print(defalutAddress);
  }

  choicepaymentmethod(String val) {
    paymentmetheod = val;
    update();
    print(paymentmetheod);
  }

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
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Address.fromJson(e)));
      } else {}
      // End
    }
    update();
  }

  checkout() async {
    statusrequst = StatusRequst.loading;

    update();

    var response = await checkuotData.addData(
        tt,
        myservices.sharedpreferences.getString("id")!,
        defalutAddress!,
        shopfee.toString(),
        cartPrice.toString(),
        couponid.toString(),
        paymentmetheod!,
        discountcoupon.toString());

    print("=============================== Controller $response ");

    statusrequst = handlingData(response);

    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar('Success ',
            "Your order has been successfully completed! Thank you for shopping with [Your E-commerce App Name]. We hope you enjoy your purchase!",
            backgroundColor: AppColor.green,
            colorText: AppColor.white,
            duration: const Duration(seconds: 4));
        Get.offAllNamed(AppRoute.bottomNavigationBar);
      } else {
        statusrequst = StatusRequst.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    st = '17';
    tt = '19';
    getaddress();
    discountcoupon = Get.arguments['discountcoupon'];
    couponid = Get.arguments['couponid'];
    cartPrice = Get.arguments['cartPrice'];
    print(cartPrice);
    super.onInit();
  }
}
