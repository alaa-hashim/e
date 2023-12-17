import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/model/images.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/slider.dart';
import 'package:ecommerce_app/model/wishlist.dart';

import 'cart.dart';
import 'catrgory.dart';
import 'order.dart';
import 'subcategory.dart';

class Shoping {
  List<Sliders> slider;
  List<Category> category;
  List<Product> product;
  List<Subcategories> subcategory;
   List<Images> images;
   List<Order> order;
    List<Cart> orderdeltils;
   List<Wishlist>wishlist;
   List<Address>address;

  Shoping({required this.slider, required this.category, required this.product, 
  required this.subcategory , required this.images , required this.order , required this.wishlist , required this.address , required this.orderdeltils});




  factory Shoping.fromJson(Map<String, dynamic> json) {



    return Shoping(
      slider: (json['slider'] as List<dynamic>?)?.map((item) => Sliders.fromJson(item)).toList() ?? [] ,
      category:  (json['category'] as List<dynamic>?)?.map((item) => Category.fromJson(item)).toList() ?? [],
         subcategory:  (json['subcategory'] as List<dynamic>?)?.map((item) => Subcategories.fromJson(item)).toList() ?? [], 
         product:  (json['product'] as List<dynamic>?)?.map((item) => Product.fromJson(item)).toList() ?? [], 
         images: (json['image'] as List<dynamic>?)?.map((item) => Images.fromJson(item)).toList() ?? [],
         order: (json['order'] as List<dynamic>?)?.map((item) => Order.fromJson(item)).toList() ?? [], 
         wishlist: (json['wishlist'] as List<dynamic>?)?.map((item) => Wishlist.fromJson(item)).toList() ?? [], 
         address: (json['address'] as List<dynamic>?)?.map((item) => Address.fromJson(item)).toList() ?? [], 
         orderdeltils: (json['orderdetial'] as List<dynamic>?)?.map((item) => Cart.fromJson(item)).toList() ?? [],  

    );
  }

}
