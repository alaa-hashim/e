import 'package:ecommerce_app/controller/homecontroller.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/wishlistcontroller.dart';
import '../screen/wishlistscreen.dart';

import 'home/customapp.dart';

bool isWishlistDataLoaded = false;

AppBar buildAppBar(BuildContext context) {
  // Pass the context as a parameter

  HomeControllermpl controller = Get.put(HomeControllermpl());
  WishlistController wish = Get.put(WishlistController());
  return AppBar(
      elevation: 0,
      backgroundColor: AppColor.bg,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: CustomAppBar(
                  titleappbar: 'what you looking for ?',
                  mycontroller: controller.search,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedSearch: () {
                    wish.onInit();

                    showBottomSheet(
                      context: context,
                      builder: (
                        context,
                      ) {
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                height:
                                    700, // Takes the full height of the bottom sheet
                                color: Colors
                                    .white, // Change to your desired color
                                child: WishlistScreen(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ))
              ],
            ),
          )));
}
