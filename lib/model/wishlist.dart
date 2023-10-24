// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'dart:convert';

List<Wishlist> wishlistFromJson(String str) =>
    List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wishlist {
  String wishlistId;
  String wishlistUserid;
  String wishlistProductid;
  String productId;
  String productName;
  String proudctNamear;
  String price;
  String detail;
  String detailsAr;
  String proudctImg;
  String subcatId;
  String count;
  DateTime date;
  String hide;
  String productDiscount;
  String proudctActive;

  Wishlist({
    required this.wishlistId,
    required this.wishlistUserid,
    required this.wishlistProductid,
    required this.productId,
    required this.productName,
    required this.proudctNamear,
    required this.price,
    required this.detail,
    required this.detailsAr,
    required this.proudctImg,
    required this.subcatId,
    required this.count,
    required this.date,
    required this.hide,
    required this.productDiscount,
    required this.proudctActive,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        wishlistId: json["wishlist_id"],
        wishlistUserid: json["wishlist_userid"],
        wishlistProductid: json["wishlist_productid"],
        productId: json["product_id"],
        productName: json["product_name"],
        proudctNamear: json["proudct_namear"],
        price: json["price"],
        detail: json["detail"],
        detailsAr: json["details_ar"],
        proudctImg: json["proudct_img"],
        subcatId: json["subcat_id"],
        count: json["count"],
        date: DateTime.parse(json["date"]),
        hide: json["hide"],
        productDiscount: json["product_discount"],
        proudctActive: json["proudct_active"],
      );

  Map<String, dynamic> toJson() => {
        "wishlist_id": wishlistId,
        "wishlist_userid": wishlistUserid,
        "wishlist_productid": wishlistProductid,
        "product_id": productId,
        "product_name": productName,
        "proudct_namear": proudctNamear,
        "price": price,
        "detail": detail,
        "details_ar": detailsAr,
        "proudct_img": proudctImg,
        "subcat_id": subcatId,
        "count": count,
        "date": date.toIso8601String(),
        "hide": hide,
        "product_discount": productDiscount,
        "proudct_active": proudctActive,
      };
}
