// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Subcatscreen extends StatelessWidget {
  const Subcatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.20,
          childAspectRatio: 1.30,
        ),
        itemCount: 10,
        itemBuilder: (context, i) {
          return;
        });
  }
}
