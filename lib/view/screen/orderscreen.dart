import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/ordercontroller.dart';
import '../../model/dropitem.dart';
import '../widget/order/orderdetil.dart';
import '../widget/order/orderitem.dart';

// ignore: must_be_immutable
class Orderscreen extends StatelessWidget {
  Orderscreen({super.key});
  String? selectedDropdownValue = '57';

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Center(
          child: Text(
            "My Orders ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: GetBuilder<OrderController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusrequst,
          widget: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Center(
                    child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    items: items.map((DropdownItem item) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: item.id, // Use the item as the value
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.title),
                        ),
                      );
                    }).toList(),
                    value: selectedDropdownValue,
                    onChanged: (String? newValue) {
                      selectedDropdownValue = newValue;
                      controller.getorders(selectedDropdownValue!);
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 45,
                      width: 140,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColor.lightgray,
                        ),
                        color: AppColor.bg,
                      ),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.black,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                )),
                InkWell(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return GetBuilder<OrderController>(
                          builder: (controller) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => Get.to(Orderdetial(
                                order: controller.data[i],
                              )),
                              child: Container(
                                  width: double.infinity,
                                  color: AppColor.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Orderimag(
                                        i: i,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Text(
                                                "#${controller.data[i].orderId}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  Jiffy.parse(controller
                                                          .data[i].oderDate
                                                          .toString())
                                                      .format(
                                                          pattern:
                                                              "dd/MM/yyyy"),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ),
                                            ]),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(children: [
                                                Text(
                                                  "Status :",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                Text(
                                                  controller.orderStatus(
                                                      controller
                                                          .data[i].orderStatus),
                                                  style: TextStyle(
                                                    color: controller.data[i]
                                                                .orderStatus ==
                                                            "0"
                                                        ? AppColor.red
                                                        : AppColor.green,
                                                  ),
                                                )
                                              ]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(children: [
                                                Text(
                                                  "order Price :",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                Text(
                                                  controller.data[i].orderPrice,
                                                  style: TextStyle(
                                                    color: controller.data[i]
                                                                .orderStatus ==
                                                            "0"
                                                        ? AppColor.red
                                                        : AppColor.green,
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }),
                )
              ]),
        ),
      ),
    );
  }
}
