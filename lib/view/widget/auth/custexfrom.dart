import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class Custextfrom extends StatelessWidget {
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) validator;
  final bool isnumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const Custextfrom(
      {Key? key,
      required this.hinttext,
      required this.iconData,
      required this.mycontroller,
      required this.validator,
      required this.isnumber,
      this.obscureText,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        keyboardType: isnumber ? TextInputType.phone : TextInputType.text,
        validator: validator,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
            hintText: hinttext,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.darkgray),
            prefixIcon: Icon(iconData)),
      ),
    );
  }
}
