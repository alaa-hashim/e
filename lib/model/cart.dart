// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  String itemsprice;
  String countitems;
  String cartId;
  String cartUserid;
  String cartItemid;
  String quantity;
  String cartOrder;
  String hides;
  DateTime cartDate;
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

  Cart({
    required this.itemsprice,
    required this.countitems,
    required this.cartId,
    required this.cartUserid,
    required this.cartItemid,
    required this.quantity,
    required this.cartOrder,
    required this.hides,
    required this.cartDate,
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

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        itemsprice: json["itemsprice"],
        countitems: json["countitems"],
        cartId: json["cart_id"],
        cartUserid: json["cart_userid"],
        cartItemid: json["cart_itemid"],
        quantity: json["quantity"],
        cartOrder: json["cart_order"],
        hides: json["hides"],
        cartDate: DateTime.parse(json["cart_date"]),
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
        "itemsprice": itemsprice,
        "countitems": countitems,
        "cart_id": cartId,
        "cart_userid": cartUserid,
        "cart_itemid": cartItemid,
        "quantity": quantity,
        "cart_order": cartOrder,
        "hides": hides,
        "cart_date": cartDate.toIso8601String(),
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
