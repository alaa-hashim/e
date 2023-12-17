// ignore_for_file: unrelated_type_equality_checks, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/satusrequst.dart';
import '../data/datasource/remote/data.dart';
import '../model/product.dart';
import '../model/shoping.dart';

class HomeController extends GetxController {
  late PageController pageController;
  int activeIndex = 0;
  void setActiveIndex(int index) {
    activeIndex = index;
    update(); // Trigger a rebuild when the activeIndex changes
  }

  Homedata homedata = Homedata(Get.find());
  TextEditingController search = TextEditingController();
  List category = [];
  

  bool isSearch = false;
  Shoping shoping=Shoping(category: [], product: [], slider: [], subcategory: [], images: [], order: [], address: [], wishlist: [], orderdeltils: []);
 
  int? selectedCat;
  List data = [];
  bool iSsearch = false;

  checksearch(val) {
    if (val == "") {
      iSsearch = false;
    }
    update();
  }

  onsearch() {
    iSsearch = true;
  }

  late StatusRequst statusrequst;
  @override


  @override
  void onInit() {
    search = TextEditingController();
    getData();

    super.onInit();
  }


  Future<void> getData()  async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await homedata.getData("1",{});

      if (response['success'] == true) {
        shoping=Shoping.fromJson(response);
        statusrequst=StatusRequst.success;
      } else {
        statusrequst = StatusRequst.failure;
      }

    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusrequst = StatusRequst.none;
      isSearch = false;
      update();
    } else {
      List<Product> searchProducts = shoping.product
        .where((product) => product.productName!.toLowerCase().contains(val.toLowerCase()))
        .toList();
      isSearch = true;
      searchProducts;
      update();
    }
  }

  onSearchItems() {
    isSearch = true;
    shoping.product;
    update();
  }

}
