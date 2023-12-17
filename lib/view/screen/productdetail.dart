// ignore_for_file: sized_box_for_whitespace, avoid_print, unused_local_variable

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cart.dart';
import '../../controller/homecontroller.dart';
import '../../controller/productdetialcontroller.dart';

import '../../model/product.dart';
import '../widget/home/recommend.dart';
import '../widget/images.dart';

class Productdetail extends StatelessWidget {
  const Productdetail({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailmpl controller = Get.put(ProductDetailmpl());
    HomeController hcontroller = Get.put(HomeController());
    CartControllers cat = Get.put(CartControllers());
    return Scaffold(
        backgroundColor: AppColor.bg,
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.black,
                  size: 25,
                ),
                onPressed: () {
                  hcontroller.onInit();
                  Get.back();
                })),
        body: GetBuilder<ProductDetailmpl>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusrequst,
            widget: Container(
              height: double.infinity,
              child: Column(children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              translateDatabase(controller.prodUct!.subcatNamear!, controller.prodUct!.subcatName!)
                              ,
                              style: const TextStyle(
                                  color: AppColor.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 160,
                          child: Text(
                            translateDatabase(
                                controller.prodUct!.proudctNamear,
                                controller.prodUct!.productName!.length > 20
                                    ? '${controller.prodUct!.productName!.substring(0, 20)}..'
                                    : controller.prodUct!
                                        .productName), // Use substring to get the first ten characters
                            style: Theme.of(context).textTheme.titleMedium,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          height: 355,
                          decoration: const BoxDecoration(
                            color: AppColor.white,
                          ),
                          child: const ImageItems()),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                          /* borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))*/
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /*
                                    Column(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 25,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ) */
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("42".tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium),
                                          ),
                                          int.parse(controller.prodUct!.price!) >
                                                  0
                                              ? Text(controller.prodUct!.price!,
                                                  style: GoogleFonts.cairo(
                                                    color: AppColor.black,
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                  ))
                                              : const Text(""),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "58".tr,
                                      style: Theme.of(context).textTheme.titleMedium
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8,
                                                bottom: 8),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: AppColor.bg,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: IconButton(
                                                icon: const FaIcon(
                                                    FontAwesomeIcons.minus),
                                                onPressed: () {
                                                  controller.remove();
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: AppColor.bg,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                              child: Text(
                                                  controller.itemcount
                                                      .toString(),
                                                  style: GoogleFonts.cairo(
                                                    color: AppColor.black,
                                                    fontSize: 20,
                                                  )),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: AppColor.bg,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: IconButton(
                                                icon: const FaIcon(
                                                    FontAwesomeIcons.plus),
                                                onPressed: () {
                                                  controller.add();
                                                },
                                              ),
                                            ),
                                          ),
                                        ])
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "59".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  translateDatabase(
                                      controller.prodUct!.detailsAr,
                                      controller.prodUct!.detail),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "More ${translateDatabase(controller.prodUct!.subcatNamear, controller.prodUct!.subcatName)} for you ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                       Recommend(productId: controller.prodUct!.productId!, subcatId: controller.prodUct!.subcatId!,),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.addItems(controller.prodUct!.productId!);
if (controller.prodUct != null) {
  Product product = controller.prodUct!;
  cat.addItem(controller.prodUct!.productId!, double.parse(controller.prodUct!.price!),translateDatabase(controller.prodUct!.proudctNamear, controller.prodUct!.productName) ,controller.prodUct!.image! );
} else {
  // Handle the case where controller.prodUct is null
}
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text("60".tr,
                            style: GoogleFonts.cairo(
                                color: AppColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
