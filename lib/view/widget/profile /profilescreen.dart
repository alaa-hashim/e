// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/view/widget/profile%20/editinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';

import '../../../controller/settingscontroller.dart';
import '../../../model/user.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.bg,
            appBar: AppBar(
              backgroundColor: AppColor.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: GetBuilder<SettingsController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusrequst,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return Useritem(
                          user: User.fromJson(controller.data[i]),
                        );
                      })),
            )));
  }
}

class Useritem extends StatelessWidget {
  User user;
  Useritem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Container(
            color: AppColor.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
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
                                      child: Editinfo(
                                        user: user,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Text("Edit Info ",
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColor.blue,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(user.user,
                        style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(user.email,
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Phone Number",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold)),
                      Text(user.phone,
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppColor.white,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Change Your Password ",
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColor.blue,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(" Password ",
                          style: TextStyle(
                              fontSize: 17,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold)),
                      Text("********",
                          style: TextStyle(
                              fontSize: 17,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppColor.white,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Account Deletion",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("We are sad to see you go , but hope see you again",
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    headerAnimationLoop: false,
                    animType: AnimType.scale,
                    title: 'Waring',
                    desc: 'Are sure you want to delete your account',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnOkOnPress: () {},
                    btnCancelOnPress: () {},
                  ).show(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Delete your  account ",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.red,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
