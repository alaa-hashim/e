import 'package:ecommerce_app/controller/cartcontroller.dart'; // Import your Cartcontroller
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottomnavcontroller.dart';
import '../../controller/homecontroller.dart';
import '../../core/constant/appcolor.dart';
import '../screen/Homescreen.dart';
import '../screen/cartscreen.dart';
import '../screen/categoryscreen.dart';
import '../screen/settings.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationBarContorller());

    return GetBuilder<BottomNavigationBarContorller>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              const Homescreen(),
              const CategoryScreen(),
              Cartscreen(), // Keep this here
              const Settings(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: controller.tabIndex,
            selectedIconTheme:
                const IconThemeData(color: AppColor.primaryColor),
            selectedItemColor: AppColor.primaryColor,
            selectedFontSize: 15,
            unselectedItemColor: Colors.black,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            onTap: (index) async {
              final cartController = Get.find<Cartcontroller>();
              final hcontroller = Get.find<HomeController>();
              Get.back();
              if (index == 2 && cartController.data.isNotEmpty) {
                cartController.onInit();
                cartController.getCart();

              }if(index == 1){
hcontroller.onInit();
              }
hcontroller.onInit();
              controller.changeTabindex(index);
            },
            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                label: "44".tr,
                backgroundColor: Colors.black,
              ),
               BottomNavigationBarItem(
                icon: const Icon(Icons.category_outlined),
                label: "45".tr,
                backgroundColor: Colors.black,
              ),
               BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  label: "46".tr,
                  backgroundColor: Colors.red),
               BottomNavigationBarItem(
                icon: const Icon(Icons.person_rounded),
                label: "47".tr,
              ),
            ],
          ),
        );
      },
    );
  }
}
