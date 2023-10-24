import 'package:flutter/material.dart';
import '../../../core/constant/appcolor.dart';

class Paymentmethod extends StatelessWidget {
  final String tital;
  final bool isActive;
  final IconData icon;
  const Paymentmethod(
      {super.key,
      required this.tital,
      required this.isActive,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  color: AppColor.bg, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: isActive == true
                    ? Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive == true
                            ? AppColor.primaryColor
                            : AppColor.white,
                      ))
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tital,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isActive == true
                        ? AppColor.primaryColor
                        : AppColor.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                  color:
                      isActive == true ? AppColor.primaryColor : AppColor.black,
                  icon),
            )
          ]),
        ),
      ),
    );
  }
}
