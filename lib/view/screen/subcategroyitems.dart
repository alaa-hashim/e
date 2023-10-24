// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../controller/productcontroller.dart';
import '../../core/class/sortoptions.dart';
import '../../core/constant/appcolor.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/translatedata.dart';
import '../../links.dart';

class SubactegroyItems extends StatelessWidget {
  const SubactegroyItems({super.key});

  @override
  Widget build(BuildContext context) {
    Rx<SortingOption> _selectedSortingOption =
        Rx(SortingOption.newArrivals); // Initialize with default option

    ProductControllerImp controller = Get.put(ProductControllerImp());
    void sortProducts(SortingOption option) {
      _selectedSortingOption.value = option; // Update the selected option
      // Rest of the sorting logic remains the same
      switch (option) {
        case SortingOption.newArrivals:
          // Sort by new arrivals logic
          controller.data.sort((a, b) => a.date.compareTo(b.date));
          break;
        case SortingOption.discount:
          // Sort by discount logic
          controller.data
              .sort((a, b) => a.productDiscount.compareTo(b.productDiscount));
          break;
        case SortingOption.priceLowToHigh:
          // Sort by price low to high logic
          controller.data.sort((a, b) => a.price.compareTo(b.price));
          break;
        case SortingOption.priceHighToLow:
          // Sort by price high to low logic
          controller.data.sort((a, b) => b.price.compareTo(a.price));
          break;
        case SortingOption.relevance:
          // Sort by relevance logic
          // Implement your custom sorting logic here
          break;
      }
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
                                builder: (context) {
                                  return Container(
                                    height: 350,
                                    width: 200,
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
                                            children: [
                                              Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 110),
                                                child: Text(
                                                  "Sort By ",
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
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
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.newArrivals;
                                            sortProducts(
                                                _selectedSortingOption.value);
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
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.discount;
                                            sortProducts(
                                                _selectedSortingOption.value);
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
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.priceHighToLow;
                                            sortProducts(
                                                _selectedSortingOption.value);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const ListTile(
                                          leading: Text(
                                            "Price: High to Low",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
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
                                          onTap: () {
                                            _selectedSortingOption.value =
                                                SortingOption.newArrivals;
                                            sortProducts(
                                                _selectedSortingOption.value);
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
              child: InkWell(
                  onTap: () {
                    // controller.goToPageProductDetails(Product: product);
                  },
                  child: GetBuilder<ProductControllerImp>(
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
                                  return Item(
                                    product: Product.fromJson(
                                        controller.data[index]),
                                  );
                                }),
                          ))),
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
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productdetail);
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
                  translateDatabase(product.proudctNamear, product.productName),
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
                    IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppColor.red,
                          size: 27,
                        ),
                        onPressed: () {}),
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
