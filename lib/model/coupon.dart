// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  String couponId;
  String couponName;
  String couponDetail;
  String couponDetailar;
  DateTime couponExprid;
  String couponDiscount;
  String couponUse;
  DateTime couponDate;

  Coupon({
    required this.couponId,
    required this.couponName,
    required this.couponDetail,
    required this.couponDetailar,
    required this.couponExprid,
    required this.couponDiscount,
    required this.couponUse,
    required this.couponDate,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        couponId: json["coupon_id"],
        couponName: json["coupon_name"],
        couponDetail: json["coupon_detail"],
        couponDetailar: json["coupon_detailar"],
        couponExprid: DateTime.parse(json["coupon_exprid"]),
        couponDiscount: json["coupon_discount"],
        couponUse: json["coupon_use"],
        couponDate: DateTime.parse(json["coupon_date"]),
      );

  Map<String, dynamic> toJson() => {
        "coupon_id": couponId,
        "coupon_name": couponName,
        "coupon_detail": couponDetail,
        "coupon_detailar": couponDetailar,
        "coupon_exprid":
            "${couponExprid.year.toString().padLeft(4, '0')}-${couponExprid.month.toString().padLeft(2, '0')}-${couponExprid.day.toString().padLeft(2, '0')}",
        "coupon_discount": couponDiscount,
        "coupon_use": couponUse,
        "coupon_date":
            "${couponDate.year.toString().padLeft(4, '0')}-${couponDate.month.toString().padLeft(2, '0')}-${couponDate.day.toString().padLeft(2, '0')}",
      };
}
