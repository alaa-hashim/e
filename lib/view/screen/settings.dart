// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use, avoid_print

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/settingscontroller.dart';
import '../../core/class/satusrequst.dart';
import '../../core/localization/changelocal.dart';
import '../widget/profile /profilescreen.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColor.bg,
        body: GetBuilder<LocaleController>(
          builder: (localeController) => HandlingDataView(
            statusRequest: localeController.statusrequst,
            widget: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    color: AppColor.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                  controller.myServices.sharedpreferences
                                      .getString("username")!,
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                  controller.myServices.sharedpreferences
                                      .getString("email")!,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: AppColor.white,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.viewaddress);
                        },
                        leading: FaIcon(
                          FontAwesomeIcons.home,
                          color: Theme.of(context).listTileTheme.iconColor,
                        ),
                        title: Text("51".tr,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).listTileTheme.iconColor,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.wish);
                        },
                        leading: FaIcon(FontAwesomeIcons.heart,
                            color: Theme.of(context).listTileTheme.iconColor),
                        title: Text("52".tr,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).listTileTheme.iconColor,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        onTap: () => Get.toNamed(AppRoute.order),
                        leading: FaIcon(FontAwesomeIcons.history,
                            color: Theme.of(context).listTileTheme.iconColor),
                        title: Text("53".tr,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).listTileTheme.iconColor,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: FaIcon(FontAwesomeIcons.message,
                            color: Theme.of(context).listTileTheme.iconColor),
                        title: Text("54".tr,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).listTileTheme.iconColor,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
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
                                      child: const Profilescreen(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        leading: FaIcon(FontAwesomeIcons.user,
                            color: Theme.of(context).listTileTheme.iconColor),
                        title: Text("50".tr,
                            style: Theme.of(context).textTheme.titleMedium),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Theme.of(context).listTileTheme.iconColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("55".tr,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Container(
                  color: AppColor.white,
                  child: Column(children: [
                    ListTile(
                      onTap: () async {
                        StatusRequst.loading;

                        String newLang =
                            localeController.language?.languageCode == "ar"
                                ? "en"
                                : "ar";
                        await localeController.changeLang(newLang);

                        print(newLang);
                        StatusRequst.none;
                      },
                      leading: FaIcon(FontAwesomeIcons.language,
                          color: Theme.of(context).listTileTheme.iconColor),
                      title: Text("56".tr,
                          style: Theme.of(context).textTheme.titleMedium),
                      trailing: SizedBox(
                        width: 77,
                        child: Row(children: [
                          Text(
                              localeController.language == const Locale("ar")
                                  ? "English"
                                  : "العربيه",
                              style: Theme.of(context).textTheme.titleMedium),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).listTileTheme.iconColor,
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () => controller.logout(),
                    leading: const Icon(
                      LineIcons.alternateSignOut,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    title: Text("57".tr,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
