// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class SignupButton extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;
  const SignupButton({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textone,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColor.darkgray,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          InkWell(
            onTap: onTap,
            child: Text(texttwo,
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
