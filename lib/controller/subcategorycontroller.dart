// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:get/get.dart';

import '../core/class/handledata.dart';
import '../core/class/satusrequst.dart';
import '../core/constant/routes.dart';
import '../data/datasource/remote/data.dart';
import '../model/shoping.dart';
import 'homecontroller.dart';

class SubcatController extends GetxController {
  HomeController controller = Get.put(HomeController());
   Homedata homedata = Homedata(Get.find());

  int? selectedCat;
  List data = [];
  List category = [];
  Shoping shoping=Shoping(category: [], product: [], slider: [], subcategory: [], images: [], order: [], address: [], wishlist: [], orderdeltils: []);
  String? catId;

  var statusrequst = StatusRequst.none;

  @override
  void onInit() {
      Map<String, dynamic>? arguments = Get.arguments as Map<String, dynamic>?;

    if (arguments != null) {

      selectedCat = arguments['selectedCat'];
      catId = arguments['id'];
      print("${catId}suctecontrolled");
      print("${selectedCat}select");
    } else {
      // If 'category' key is null, set the default category index
      selectedCat = 0; // Assuming 0 is the index of the first category
      catId = '1';
       // Set a default value for subId
    }
getData();
    super.onInit();
  }

  
  changeCat(val, catval) {
    selectedCat = val;
    catId = catval;

    geTsub(catval!);
    update();
  }

  Future<void> getData()  async {
    statusrequst = StatusRequst.loading;
    update();
    var response = await homedata.getData("2",{});
    statusrequst = handlingData(response);
    if (statusrequst == StatusRequst.success) {
      if (response['success'] == true) {
        shoping=Shoping.fromJson(response);
    List<dynamic> filteredSubcategories = shoping.subcategory.where((sub) => sub.catId == catId).toList();
      data.addAll(filteredSubcategories);
      } else {
        statusrequst = StatusRequst.failure;
      }
    }
    update();
  }

geTsub(subId) async {
    data= shoping.subcategory.where((sub) => sub.catId == subId).toList();
  update();
}

  goBack() {
    Get.offNamed(AppRoute.bottomNavigationBar);
  }
}
