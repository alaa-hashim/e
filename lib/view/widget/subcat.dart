import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/subcategorycontroller.dart';
import '../../core/class/handlindatview.dart';
import '../../model/subcategory.dart';

class SubCat extends StatelessWidget {
  const SubCat({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SubcatController controller = Get.put(SubcatController());
    return Container(
      height: 155,
      width: double.infinity,
      color: AppColor.bg,
      child: GetBuilder<SubcatController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusrequst,
          widget: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                return SubCatItem(
                  subcategories: Subcategories.fromJson(controller.data[i]),
                );
              }),
        ),
      ),
    );
  }
}

class SubCatItem extends StatelessWidget {
  final Subcategories subcategories;
  const SubCatItem({super.key, required this.subcategories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 8.0,
        top: 14.0,
      ),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.blue, borderRadius: BorderRadius.circular(10)),
          height: 159,
          width: 375,
        ),
        Positioned(
            left: 190,
            top: 40,
            child: RichText(
              text: TextSpan(
                text: translateDatabase(
                    subcategories.subcatName, subcategories.subcatName),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
        Positioned(
          left: 190,
          top: 85,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.blue, borderRadius: BorderRadius.circular(17)),
            height: 35,
            width: 110,
            child: const Center(
              child: Text(
                "See More",
                style: TextStyle(color: AppColor.white),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
