// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/subcategory.dart';


abstract class SubcatController extends GetxController {
  inailData();
  changeCat(int val, catval);
  geTsub(String subId);
  goBack();
  goTproduct(List category, int selectedCat, String subId);
}

class SubcatControllerImp extends SubcatController {
  late String st;
  late String ct;
  late String tt;
  List subcategory = [];
   List subcategors = [];
  

  int? selectedCat;
  List data = [];
  List category = [];
  String? subId;

  late StatusRequst statusrequst;
  SubData subdata = SubData(Get.find());

  @override
  void onInit() {
    inailData();
    super.onInit();
  }

  @override
  inailData() {
    ct = '1';
    st = '2';
    tt = '250';
    getCat();
    getdata();
    Map<String, dynamic>? arguments = Get.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      subcategory = arguments['category'] ?? [];
      selectedCat = arguments['selectedCat'];
      subId = arguments['categoryId'];
    } else {
      // If 'category' key is null, set the default category index
      selectedCat = 0; // Assuming 0 is the index of the first category
      subId = '1'; // Set a default value for subId
    }

    geTsub(subId!);
  }

  @override
  changeCat(val, catval) {
    print("changeCat called with val: $val, catval: $catval");
    selectedCat = val;
    subId = catval;

    // Get the subcategories for the new category ID
    geTsub(subId!);
    update();
  }

  @override
  geTsub(subId) async {
    data.clear();
    statusrequst = StatusRequst.loading;
    // Notify UI about the loading state

    var response = await subdata.getData(subId, st);
    statusrequst = hadlingData(response);

    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        data.addAll(response['data']);

        // Use assignAll to update the RxList
      } else {
        statusrequst = StatusRequst.failure;
      }
    }

    update(); // Notify UI about the new data and status
  }

  getdata() async {
    subcategors.clear();
    statusrequst = StatusRequst.loading;
    // Notify UI about the loading state

    var response = await subdata.getsub(tt);
    statusrequst = hadlingData(response);

    if (statusrequst == StatusRequst.success) {
      if (response['status'] == "success") {
        
        subcategors.addAll(response['data']);

        // Use assignAll to update the RxList
      } else {
        statusrequst = StatusRequst.failure;
      }
    }

    update(); // Notify UI about the new data and status
  }
  Future<void> getCat() async {
    category.clear();
    statusrequst = StatusRequst.loading;
    var response = await subdata.getcat(ct);
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
  goTproduct(List category, int selectedCat, String subId) {
    Get.toNamed(AppRoute.items, arguments: {
      //"subcat": category,
      "selectedsub": selectedCat,
      "subId": subId,
    });
  }

  @override
  goBack() {
    Get.offNamed(AppRoute.bottomNavigationBar);
  }
}
