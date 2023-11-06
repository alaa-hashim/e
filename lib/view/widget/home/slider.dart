// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/homecontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constant/imageasset.dart';
import '../../../links.dart';
import '../../../model/slider.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Homesliders extends StatefulWidget {
  const Homesliders({Key? key}) : super(key: key);

  @override
  _HomeslidersState createState() => _HomeslidersState();
}

class _HomeslidersState extends State<Homesliders> {
  CarouselController carouselController = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    HomeControllermpl controller = Get.put(HomeControllermpl());

    return GetBuilder<HomeControllermpl>(
      builder: (controller) => Stack(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CarouselSlider.builder(
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index; // Update the activeIndex locally
                  });
                },
              ),
              itemCount: controller.slider.length,
              itemBuilder: (context, i, realIndex) {
                return SliderItem(
                  sliders: Sliders.fromJson(controller.slider[i]),
                );
              },
            ),
          ),
          Positioned(
            top: 120,
            left: 120,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: controller.slider.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Color(0xff126881),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  final Sliders sliders;
  const SliderItem({super.key, required this.sliders});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          child: sliders.img!.isNotEmpty
              ? CachedNetworkImage(
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: "${AppLink.imagestSliders}/${sliders.img!}",
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Center(
                  child: Lottie.asset(
                    AppImageAsset.noImage,
                    width: 100,
                    height: 100,
                  ),
                )),
    ]);
  }
}
