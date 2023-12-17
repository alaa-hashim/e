// ignore_for_file: avoid_renaming_method_parameters, avoid_print, unnecessary_null_comparison

import 'package:ecommerce_app/core/class/satusrequst.dart';
import 'package:get/get.dart';
import '../core/class/sortoptions.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
import 'homecontroller.dart';



class ProductController extends GetxController {
 
  String? subcatId;
  int? selectedCat;
  Rx<SortingOption> selectedSortingOption = Rx(SortingOption.newArrivals);

  Myservices myservices = Get.put(Myservices());
  List<dynamic> data = [];
  var statusrequst = StatusRequst.none;
  @override
  void onInit() {
  
     Map<dynamic, dynamic>? arguments = Get.arguments;
    if (arguments != null) {
      selectedCat = arguments['selectedsub'];
      subcatId = arguments['subId'];
print("$subcatId+product++subcat");
      getItems(subcatId!);
    } else {
     
    }
    super.onInit();
  }

 
  HomeController controller = Get.put(HomeController());
 
 
getItems(subcatId) async {
  data.clear();
  statusrequst = StatusRequst.loading;
update();
  
  if (controller.shoping.product != null) {
    List<dynamic> filteredProduct = controller.shoping.product.where((item) => item.subcatId == subcatId).toList();
    
    // Sort the filtered product based on the selected option
    switch (selectedSortingOption.value) {
      case SortingOption.newArrivals:
        filteredProduct.sort((a, b) => a.date.compareTo(b.date));
        break;
      case SortingOption.discount:
        filteredProduct.sort((a, b) => a.productDiscount.compareTo(b.productDiscount));
        break;
      case SortingOption.priceLowToHigh:
        filteredProduct.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortingOption.priceHighToLow:
        filteredProduct.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortingOption.relevance:
        // Implement your custom sorting logic here
        filteredProduct;
        break;
    }

    data.addAll(filteredProduct);
    statusrequst = StatusRequst.success;
  update();
  } else {
    // Handle the case where subcategories is null
    statusrequst = StatusRequst.loading;
  }

  
}


  goToPageProductDetails(prodUct) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      "product": prodUct,
    });
  }

  goBack() {
    Get.toNamed(AppRoute.subcategory);
  }
}
