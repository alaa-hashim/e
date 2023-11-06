// ignore_for_file: avoid_renaming_method_parameters, avoid_print

import 'package:ecommerce_app/core/class/satusrequst.dart';
import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/items.dart';
import '../model/product.dart';

abstract class ProductController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);

  goToPageProductDetails(Product prodUct);
  goBack();
  recommend(
    List category,
    int selectedCat,
    int categoryId,
  );
}

class ProductControllerImp extends ProductController {
  // List categories = [];
  String? categoryId;
  late String st;
  late String tt;
  int? selectedCat;

  Myservices myservices = Get.put(Myservices());
  ItemsData itemsData = ItemsData(Get.find());

  List<dynamic> data = [];
  List<Product> items = [];

  var statusrequst = StatusRequst.none;

  // MyServices myServices = Get.find();

  @override
  void onInit() {
    // search = TextEditingController();
    intialData();
    st = '120';
    super.onInit();
  }

  @override
  intialData() {
    st = '120';
    tt = '190';
    getProduct();

    Map<String, dynamic>? arguments = Get.arguments;

    if (arguments != null) {
      selectedCat = arguments['selectedsub'];
      categoryId = arguments['subId'];

      getItems(categoryId!);
    } else {
      // Handle the case where Get.arguments is null or does not contain the expected keys.
      // You can add error handling or default values here.
    }
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    categoryId = catval;
    getItems(categoryId!);
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusrequst = StatusRequst.loading;
    var response = await itemsData.getData(
        categoryId, st, myservices.sharedpreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusrequst = handlingData(response);
    if (StatusRequst.success == statusrequst) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequst = StatusRequst.failure;
      }
      // End
    }
    update();
  }

  getProduct() async {
    items.clear();
    statusrequst = StatusRequst.loading;
    // Notify UI about the loading state

    var response = await itemsData.getItems(
        myservices.sharedpreferences.getString("id")!, tt);
    statusrequst = hadlingData(response);

    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        List dataresponse = response['data'];
        items.addAll(dataresponse.map((e) => Product.fromJson(e)));

        // Use assignAll to update the RxList
      } else {
        statusrequst = StatusRequst.failure;
      }
    }

    update(); // Notify UI about the new data and status
  }

  @override
  goToPageProductDetails(prodUct) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      "product": prodUct,
    });
  }

  @override
  goBack() {
    Get.toNamed(AppRoute.subcategory);
  }

  @override
  recommend(
    List category,
    int selectedCat,
    int categoryId,
  ) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      "category": category,
      "selectedCat": selectedCat,
      "categoryId": categoryId,
    });
  }
}
