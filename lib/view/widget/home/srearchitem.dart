// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';

import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homecontroller.dart';
import '../../../core/constant/routes.dart';
import '../../../links.dart';

class SearchItem extends GetView<HomeController> {
  final List<Product> listdatamodel;
  const SearchItem({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        children: [
          ListView.builder(
              itemCount: listdatamodel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.homedata.redirect(AppRoute.productdetail,{"product":listdatamodel[index]});
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imagestItems}/${listdatamodel[index].proudctImg}")),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(translateDatabase(
                                  listdatamodel[index].proudctNamear,
                                  listdatamodel[index].productName)),
                              subtitle: Text(
                                  "${"In"} ${translateDatabase(listdatamodel[index].subcatNamear, listdatamodel[index].subcatName)}"),
                            )),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
