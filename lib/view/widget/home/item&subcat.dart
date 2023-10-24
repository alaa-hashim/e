// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/homecontroller.dart';

import '../../../core/constant/appcolor.dart';
import '../../../core/constant/imageasset.dart';
import '../../../links.dart';
import '../../../model/product.dart';

class SubcatandItem extends StatelessWidget {
  const SubcatandItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllermpl controller = Get.put(HomeControllermpl());
    List<Product> products = List<Product>.from(
        controller.product.map((data) => Product.fromJson(data)));

    List<int> displayedSubcatIds = [];

    return Container(
      color: AppColor.bg,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            Product product = products[i];
            if (displayedSubcatIds.contains(product.subcatId)) {
              return const SizedBox.shrink();
            }
            displayedSubcatIds.add((product.subcatId!));

            List<Product> subcategoryProducts =
                products.where((p) => p.subcatId == product.subcatId).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        product.subcatName ??
                            'Unknown Subcategory', // Provide a default value if null
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 260,
                  child: GetBuilder<HomeControllermpl>(
                    builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusrequst,
                      widget: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: subcategoryProducts.length,
                        itemBuilder: (context, index) {
                          Product subProduct = subcategoryProducts[index];
                          return Item(product: subProduct);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Product product;
  const Item({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    HomeControllermpl controller = Get.put(HomeControllermpl());
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: AppColor.white,
            child: SizedBox(
              height: 230,
              width: 195,
              child: Column(
                children: [
                  Container(
                    height: 165,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 155,
                          child: Text(
                            softWrap: true,
                            (product.productName!.length > 20)
                                ? '${product.productName!.substring(0, 20)}..' // Add ".." when the string is longer
                                : product
                                    .productName!, // Use the full name if it's shorter than 20 characters
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("42".tr,
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        Text(
                          product.price!.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
