import 'package:ecommerce_app/controller/cartcontroller.dart'; // Import your Cartcontroller
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottomnavcontroller.dart';
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
              Get.back();
              if (index == 2 && cartController.data.isNotEmpty) {
                cartController.onInit();
              }

              controller.changeTabindex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Categories',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'My account',
              ),
            ],
          ),
        );
      },
    );
  }
}
