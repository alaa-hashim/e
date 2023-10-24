import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/settingscontroller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/validater.dart';
import '../../../model/user.dart';

class Editinfo extends StatelessWidget {
  final User user;
  const Editinfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    controller.username.text = user.user;
    controller.email.text = user.email;
    controller.phone.text = user.phone;

    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<SettingsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusrequst,
            widget: Form(
              key: controller.editstate,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      return inputvalidater(
                          val!, 8, 30, "this field is required");
                    },
                    controller: controller.email,
                    decoration: const InputDecoration(
                        labelText: 'Email', hintText: 'Enter Email Address'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return inputvalidater(
                          val!, 3, 30, "this field is required");
                    },
                    controller: controller.username,
                    decoration: const InputDecoration(
                        labelText: 'First Name', hintText: 'First Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.phone,
                    decoration: const InputDecoration(
                        labelText: 'Phone Number', hintText: 'Phone Number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 230,
                    height: 55,
                    child: MaterialButton(
                      onPressed: () {
                        controller.edit();
                      },
                      textColor: AppColor.white,
                      child: const Text(
                        "Save ",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
