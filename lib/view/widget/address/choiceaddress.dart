import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class Defaultaddrss extends StatelessWidget {
  final String tital;
  final bool isActive;
  final IconData icon;
  const Defaultaddrss(
      {super.key,
      required this.tital,
      required this.isActive,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(),
            color: isActive == true ? AppColor.blue : AppColor.white,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
                size: 15,
                color: isActive == true ? AppColor.white : AppColor.black,
                icon),
            const SizedBox(
              width: 7,
            ),
            Text(
              tital,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isActive == true ? AppColor.white : AppColor.black),
            ),
          ]),
        ),
      ),
    );
  }
}
