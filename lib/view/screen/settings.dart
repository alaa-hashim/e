// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
        body: ListView(
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
                              style: Theme.of(context).textTheme.titleLarge),
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
                              style: Theme.of(context).textTheme.titleSmall),
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
                    title: Text("Addresses",
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
                      () => Get.toNamed(AppRoute.wish);
                    },
                    leading: FaIcon(FontAwesomeIcons.heart,
                        color: Theme.of(context).listTileTheme.iconColor),
                    title: Text("Wishlist ",
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
                    title: Text("Orders",
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
                    leading: FaIcon(FontAwesomeIcons.message,
                        color: Theme.of(context).listTileTheme.iconColor),
                    title: Text("Notifications",
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
                    title: Text("Profile",
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).listTileTheme.iconColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("SETTINGS",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            GetBuilder<LocaleController>(
              builder: (localeController) => HandlingDataView(
                statusRequest: localeController.statusrequst,
                widget: Container(
                  color: AppColor.white,
                  child: Column(children: [
                    ListTile(
                      onTap: () async {
                        StatusRequst.loading;

                        String newLang =
                            localeController.language == const Locale("ar")
                                ? "en"
                                : "ar";
                        localeController.changeLang(newLang);
                        // Update the locale to reflect the language change
                        Locale newLocale = Locale(newLang);
                        Get.updateLocale(newLocale);

                        // Hide the loader after the language change is complete

                        StatusRequst.loading;
                      },
                      leading: FaIcon(FontAwesomeIcons.language,
                          color: Theme.of(context).listTileTheme.iconColor),
                      title: Text("language",
                          style: Theme.of(context).textTheme.titleMedium),
                      trailing: SizedBox(
                        width: 75,
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
              ),
            ),
          ],
        ));
  }
}
