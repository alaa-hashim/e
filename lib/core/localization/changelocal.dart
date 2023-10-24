import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../class/satusrequst.dart';
import '../constant/appthem.dart';
import '../functions/firebasemass.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  Myservices myServices = Get.put(Myservices());
  var statusrequst = StatusRequst.none;

  ThemeData appTheme = themeEnglish;

  Future<void> changeLang(String langcode) async {
    statusrequst = StatusRequst.loading;
    Locale locale = Locale(langcode);
    myServices.sharedpreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

    // Wait for a brief moment to ensure the language change completes.
    await Future.delayed(const Duration(seconds: 3));

    // Set status to none after the language change is complete.
    statusrequst = StatusRequst.none;
    update();
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedpreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
