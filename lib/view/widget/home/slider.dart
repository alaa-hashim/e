// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/homecontroller.dart';

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constant/imageasset.dart';
import '../../../links.dart';
import '../../../model/slider.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Homesliders extends StatelessWidget {
  const Homesliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllermpl controller = Get.put(HomeControllermpl());
    CarouselController carouselController = CarouselController();
    int activeIndex = 0; // Initialize the active index

    // Create a Timer to scroll to the next item periodically

    return SizedBox(
      height: 175,
      child: GetBuilder<HomeControllermpl>(
        builder: (controller) => Stack(
          children: [
            CarouselSlider.builder(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 175,
                autoPlay: true, // Enable auto-play within CarouselSlider
                enableInfiniteScroll: false, // Enable infinite scroll
                viewportFraction: 1.0, // Display one item at a time
                onPageChanged: (index, reason) {
                  // Update the active index when page changes
                  activeIndex = index;
                },
              ),
              itemCount: controller.slider.length,
              itemBuilder: (context, i, realIndex) {
                return Stack(
                  children: [
                    SliderItem(
                      sliders: Sliders.fromJson(controller.slider[i]),
                    ),
                    Positioned(
                      top: 130,
                      left: 120,
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex, // Use the activeIndex here
                        count: controller.slider.length,
                        effect: const ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          activeDotColor: Color(0xff126881),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  final Sliders sliders;
  const SliderItem({super.key, required this.sliders});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
          child: sliders.img!.isNotEmpty
              ? CachedNetworkImage(
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
      Positioned(
          left: 140,
          top: 40,
          child: Text(
            translateDatabase(sliders.nameAr, sliders.name),
            style: const TextStyle(color: AppColor.black),
          )),
      Positioned(
        left: 170,
        top: 65,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.blue, borderRadius: BorderRadius.circular(17)),
          height: 35,
          width: 110,
          child: const Center(
            child: Text(
              "See More",
              style: TextStyle(color: AppColor.white),
            ),
          ),
        ),
      )
    ]);
  }
}
