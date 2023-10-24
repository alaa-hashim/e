// ignore_for_file: unused_import

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/Homescreen.dart';
import 'package:ecommerce_app/view/screen/address/addressdetail.dart';
import 'package:ecommerce_app/view/screen/address/addressmap.dart';
import 'package:ecommerce_app/view/screen/address/viewaddresses.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/cartscreen.dart';
import 'package:ecommerce_app/view/screen/categoryscreen.dart';
import 'package:ecommerce_app/view/screen/checkout.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
import 'package:ecommerce_app/view/screen/orderscreen.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:ecommerce_app/view/screen/splashscreen.dart';
import 'package:ecommerce_app/view/screen/subcategroy.dart';
import 'package:ecommerce_app/view/screen/subcategroyitems.dart';
import 'package:ecommerce_app/view/screen/wishlistscreen.dart';
import 'package:ecommerce_app/view/widget/bottomnavbar.dart';
import 'package:get/get.dart';

import 'core/middleware/middleware.dart';

import 'view/screen/lang.dart';
import 'view/screen/productdetail.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Lang(), middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoute.onboadring,
    page: () => const OnBoarding(),
  ),
  GetPage(name: AppRoute.signup, page: () => const Signup()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(
    name: AppRoute.bottomNavigationBar,
    page: () => const Bottomnavbar(),
  ),
  GetPage(
    name: AppRoute.homepage,
    page: () => const Homescreen(),
  ),
  GetPage(
    name: AppRoute.productdetail,
    page: () => const Productdetail(),
  ),
  GetPage(
    name: AppRoute.category,
    page: () => const CategoryScreen(),
  ),
  GetPage(name: AppRoute.subcategory, page: () => const Subcategory()),
  GetPage(
    name: AppRoute.addressmap,
    page: () => const Addressmap(),
  ),
  GetPage(
    name: AppRoute.addressdetail,
    page: () => const Addressdetail(),
  ),
  GetPage(name: AppRoute.items, page: () => const SubactegroyItems()),
  GetPage(name: AppRoute.checkout, page: (() => const Checkout())),
  GetPage(name: AppRoute.settings, page: (() => const Settings())),
  GetPage(name: AppRoute.viewaddress, page: (() => const Viewaddresses())),
  GetPage(
    name: AppRoute.cart,
    page: (() => Cartscreen()),
  ),
  GetPage(
    name: AppRoute.wish,
    page: (() => WishlistScreen()),
  ),
  GetPage(
    name: AppRoute.splash,
    page: (() => const Splashscreen()),
  ),
  GetPage(
    name: AppRoute.order,
    page: (() => const Orderscreen()),
  ),
];
