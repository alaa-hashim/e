// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, unused_local_variable, unrelated_type_equality_checks, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/class/sortoptions.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/homecontroller.dart';
import '../../controller/productcontroller.dart';
import '../../controller/wishlistcontroller.dart';
import '../../core/constant/appcolor.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/translatedata.dart';
import '../../links.dart';

class SubactegroyItems extends StatelessWidget {
  int? selectedIndex = 0 ;
  SubactegroyItems({super.key});
  @override
  Widget build(BuildContext context) {
    WishlistController wishlistcont = Get.put(WishlistController());
    ProductController controller = Get.put(ProductController());
    Rx<SortingOption> _selectedSortingOption = Rx(SortingOption.newArrivals);
    void sortProducts(SortingOption option) {
      controller.selectedSortingOption.value = option;
      controller.getItems(controller.subcatId);
    }

    void updateActiveIndex(int index) {
      selectedIndex = index;
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: AppColor.bg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 25),
              child: Container(
                height: 55,
                width: 35,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 350,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            topLeft: Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Sort By ",
                                                style: TextStyle(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Text(
                                            "New Arrivals",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: AppColor.bg,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: selectedIndex == 0
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectedIndex == 0
                                                          ? AppColor
                                                              .primaryColor
                                                          : AppColor.white,
                                                    ))
                                                  : null,
                                            ),
                                          ),
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.newArrivals;
                                            sortProducts(
                                                _selectedSortingOption.value);
                                            updateActiveIndex(0);
                                            Navigator.pop(
                                                context); // Close the bottom sheet
                                          },
                                        ),
                                        ListTile(
                                          leading: const Text(
                                            "Discount",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: AppColor.bg,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: selectedIndex == 1
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectedIndex == 1
                                                          ? AppColor
                                                              .primaryColor
                                                          : AppColor.white,
                                                    ))
                                                  : null,
                                            ),
                                          ),
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.discount;
                                            sortProducts(
                                                _selectedSortingOption.value);
                                            updateActiveIndex(1);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: const Text(
                                            "Price: Low to High",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: AppColor.bg,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: selectedIndex == 2
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectedIndex == 2
                                                          ? AppColor
                                                              .primaryColor
                                                          : AppColor.white,
                                                    ))
                                                  : null,
                                            ),
                                          ),
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.priceLowToHigh;
                                            sortProducts(
                                                _selectedSortingOption.value);
                                            updateActiveIndex(2);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.priceHighToLow;
                                            sortProducts(
                                                _selectedSortingOption.value);
                                            updateActiveIndex(3);
                                            Navigator.pop(context);
                                          },
                                          leading: const Text(
                                            "Price: High to Low",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: AppColor.bg,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: selectedIndex == 3
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectedIndex == 3
                                                          ? AppColor
                                                              .primaryColor
                                                          : AppColor.white,
                                                    ))
                                                  : null,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Text(
                                            "Relevance",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: AppColor.bg,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: selectedIndex == 4
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectedIndex == 4
                                                          ? AppColor
                                                              .primaryColor
                                                          : AppColor.white,
                                                    ))
                                                  : null,
                                            ),
                                          ),
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.relevance;
                                            sortProducts(
                                                _selectedSortingOption.value);
                                            updateActiveIndex(4);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ]),
                                    ),
                                  );
                                });
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                color: AppColor.black,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                color: AppColor.black,
                              ),
                              Text(
                                "Sort",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 1,
                        ),
                        const Icon(
                          Icons.filter_list_alt,
                          color: AppColor.black,
                        ),
                        const Text(
                          "Filter",
                          style: TextStyle(fontSize: 20),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<ProductController>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusrequst,
                        widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: controller.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              print("${controller.data.length}++product");

                              return Item(
                                product: controller.data[index],
                              );
                            }),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Product product;
  const Item({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return InkWell(
      onTap: () {
        //controller.getImages(product.productId!);
        controller.homedata
            .redirect(AppRoute.productdetail, {"product": product});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: product.proudctImg!.isNotEmpty
                  ? CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl:
                          "${AppLink.imagestItems}/${product.proudctImg!}",
                    )
                  : Center(
                      child: Lottie.asset(
                        AppImageAsset.noImage,
                        width: 100,
                        height: 100,
                      ),
                    ),
            ),
            Positioned(
                top: 165,
                left: 10,
                child: Text(
                  translateDatabase(
                    product.proudctNamear!.length > 20
                        ? '${product.proudctNamear!.substring(0, 20)}..'
                        : product.proudctNamear!,
                    product.productName!.length > 20
                        ? '${product.productName!.substring(0, 20)}..' // Add ".." when the string is longer
                        : product.productName!,
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                )),
            /* Positioned(
                top: 205,
                left: 30,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )),*/
            Positioned(
                top: 185,
                left: 10,
                child: Row(
                  children: [
                    Text("42".tr,
                        style: Theme.of(context).textTheme.titleSmall),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        product.price.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                )),
            Positioned(
                top: 195,
                left: 5,
                child: Row(
                  children: [
                    GetBuilder<WishlistController>(
                      builder: (controller) => IconButton(
                          icon: Icon(
                            controller.isWished[product.productId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                          onPressed: () {
                            if (controller.isWished[product.productId] == "1") {
                              controller.setWished(product.productId, "0");
                              controller.deletewish(product.productId);
                            } else {
                              controller.setWished(product.productId, "1");
                              controller.addwish(product.productId);
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 40, top: 8, bottom: 8),
                      child: IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: AppColor.black,
                            size: 27,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
