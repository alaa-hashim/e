import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/homecontroller.dart';
import '../../core/constant/imageasset.dart';
import '../../links.dart';
import '../../model/images.dart';

class ImageItems extends StatefulWidget {
  const ImageItems({super.key});

  @override
  State<ImageItems> createState() => _ImageItemsState();
}

class _ImageItemsState extends State<ImageItems> {
  CarouselController carouselController = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetBuilder<HomeController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusrequst,
        widget: Column(
          children: [
            CarouselSlider.builder(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 345,

                  autoPlay: false, // Enable auto-play within CarouselSlider
                  enableInfiniteScroll: false, // Enable infinite scroll
                  viewportFraction: 1.2, // Display one item at a time
                  onPageChanged: (index, reason) {
                    // Update the active index when page changes
                    setState(() {
                      activeIndex = index; // Update the activeIndex locally
                    });
                  },
                ),
                itemCount: controller.shoping.images.length,
                itemBuilder: (context, i, realIndex) {
                  return ImageItem(
                    image: controller.shoping.images[i],
                  );
                }),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex, // Use the activeIndex here
              count: controller.shoping.images.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Color(0xff126881),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final Images image;
  const ImageItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: image.imageName.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: "${AppLink.imagestItems}/${image.imageName}",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Center(
                child: Lottie.asset(
                  AppImageAsset.noImage,
                  width: 100,
                  height: 100,
                ),
              ));
  }
}
