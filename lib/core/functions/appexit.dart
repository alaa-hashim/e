import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> appExit() {
  Get.defaultDialog(
    title: "Wornging",
    middleText: "do you want to exit from the app?",
    actions: [
      ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text("Confirm")),
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel")),
    ],
  );
  return Future.value(false);
}
