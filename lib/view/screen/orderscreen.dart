import 'package:flutter/material.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "My Orders ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: []),
    );
  }
}
