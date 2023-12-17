import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustmButtom extends StatelessWidget {
  final String text;
  const CustmButtom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: AppColor.primaryColor,
      textColor: AppColor.white,
      child: Text(text),
    );
  }
}
