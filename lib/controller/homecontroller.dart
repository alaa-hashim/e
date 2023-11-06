// ignore_for_file: unrelated_type_equality_checks, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/homedata.dart';
import '../model/product.dart';
import '../model/subcategory.dart';

abstract class HomeController extends GetxController {
  void inialData();

  Future<void> getSlider();
  Future<void> getDiscount();
  Future<void> getData();
//  Future<void> getCart();
  Future<void> getSub();
  late String st;
  late String tt;
  late String su;
  late String ss;
  late String tr;
  late String cc;
  late String tv;
  late String vt;
  late String it;
  late String rt;

  void goTosub(List category, int selectedCat, String categoryId);
  goToPageProductDetails(Product prodUct);

  changeCat(int val, catval);
}

class HomeControllermpl extends HomeController {
  late PageController pageController;
  Myservices myservices = Get.put(Myservices());
  String? username;
  String? itemid;
  int activeIndex = 0;
  void setActiveIndex(int index) {
    activeIndex = index;
    update(); // Trigger a rebuild when the activeIndex changes
  }

  Homedata homedata = Homedata(Get.find());
  TextEditingController search = TextEditingController();
  List category = [];
  List<Subcategories> subcategory = []; // Make sure this is correctly typed

  List<dynamic> product = [];
  List<Product> listdata = [];
  bool isSearch = false;
  List slider = [];
  List discount = [];
  int? selectedCat;
  List data = [];
  List cart = [];
  List image = [];
  List recom = [];
  List views = [].obs;
  String? subId;
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
  void inialData() {
    st = '1';
    tt = '21';
    su = '3';
    ss = '22';
    tr = '2';
    cc = '90';
    tv = '53';
    vt = '54';
    it = '222';
    rt = '330';

    // Set the subcategories as the default value for the subcategories property.

    username = myservices.sharedpreferences.getString("username");
  }

  // ignore: unnecessary_overrides
  @override
  void onInit() {
    search = TextEditingController();
    inialData();
    getData();
    getDiscount();
    getSlider();
    getSub();
    subdata();
    dataviews();

    // getCart();

    super.onInit();
  }

  @override
  Future<void> getData() async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.postData(st);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        category.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  goTosub(category, selectedCat, categoryId) {
    Get.offNamed(AppRoute.subcategory, arguments: {
      "category": category,
      "selectedCat": selectedCat,
      "categoryId": categoryId,
    });
  }

  @override
  getDiscount() async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.getDisc(tt);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        discount.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  getViews(itemid) async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.insertData(
        tv, myservices.sharedpreferences.getString("id")!, itemid);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        // discount.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  getSub() async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.getDisc(su);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        product.addAll(response['data']);
        print("${product.length} product added");
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  dataviews() async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.viewData(
        vt, myservices.sharedpreferences.getString("id")!);
    print("=============================== view $response ");
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        views.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  Future<void> getSlider() async {
    slider.clear();
    statusrequst = StatusRequst.loading;
    var response = await homedata.getDisc(ss);
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        slider.addAll(response['data']);
        print("${slider.length} iamge");
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(prodUct) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      "product": prodUct,
    });
  }

  getImages(String itemids) async {
    image.clear();
    update();
    statusrequst = StatusRequst.loading;
    var response = await homedata.getimage(itemids, it);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        image.clear();
        image.addAll(response['data']);
        print("${image.length} iamge");
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  getrecoomm(String itemid, String subcatid) async {
    recom.clear();
    statusrequst = StatusRequst.loading;
    var response = await homedata.getrecommed(rt, itemid, subcatid);
    print("=============================== recoomend $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        recom.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  List<dynamic> filteredSubcategories1(String catval) {
    return subcategory.where((sub) => sub.catId == catval).toList();
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    subId = catval;

    // Filter the subcategories based on the selected category
    List<dynamic> filteredSubs = filteredSubcategories1(catval);

    // Cast the filtered subcategories to List<Subcategories>
    subcategory = filteredSubs.cast<Subcategories>();

    update();
  }

  subdata() async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.getSub(tr);
    statusrequst = handlingData(response);

    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        final List<dynamic> responseData = response['data'];
        // Convert dynamic objects to Subcategories and add them to the subcategory list
        subcategory
            .addAll(responseData.map((data) => Subcategories.fromJson(data)));
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

  Future<void> searchData() async {
    statusrequst = StatusRequst.loading;
    var response = await homedata.getsearch(cc, search.text);
    print("=============================== search $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => Product.fromJson(e)));
      } else {
        statusrequst = StatusRequst.notFound;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusrequst = StatusRequst.none;
      isSearch = false;
      update();
    } else {
      isSearch = true;
      searchData();
      update();
    }
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
