// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  String orderId;
  String orderUserid;
  DateTime oderDate;
  String orderPayment;
  String orderAddress;
  String orderPrice;
  String orderCoupon;
  String orderStatus;
  String orderDeliveryPrice;
  String orderTotalPrice;
  String orderDelivery;
  String addressId;
  String userAddress;
  String addressName;
  String city;
  String street;
  String building;
  String apartment;
  String addressPhone;
  String addressLong;
  String addressLat;
  String addressType;
  String addressImage;
  DateTime addressDate;

  Order({
    required this.orderId,
    required this.orderUserid,
    required this.oderDate,
    required this.orderPayment,
    required this.orderAddress,
    required this.orderPrice,
    required this.orderCoupon,
    required this.orderStatus,
    required this.orderDeliveryPrice,
    required this.orderTotalPrice,
    required this.orderDelivery,
    required this.addressId,
    required this.userAddress,
    required this.addressName,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.addressPhone,
    required this.addressLong,
    required this.addressLat,
    required this.addressType,
    required this.addressImage,
    required this.addressDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        orderUserid: json["order_userid"],
        oderDate: DateTime.parse(json["oder_date"]),
        orderPayment: json["order_payment"],
        orderAddress: json["order_address"],
        orderPrice: json["order_price"],
        orderCoupon: json["order_coupon"],
        orderStatus: json["order_status"],
        orderDeliveryPrice: json["order_delivery_price"],
        orderTotalPrice: json["order_total_price"],
        orderDelivery: json["order_delivery"],
        addressId: json["address_id"],
        userAddress: json["user_address"],
        addressName: json["address_name"],
        city: json["city"],
        street: json["street"],
        building: json["building"],
        apartment: json["apartment"],
        addressPhone: json["address_phone"],
        addressLong: json["address_long"],
        addressLat: json["address_lat"],
        addressType: json["address_type"],
        addressImage: json["address_image"],
        addressDate: DateTime.parse(json["address_date"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_userid": orderUserid,
        "oder_date": oderDate.toIso8601String(),
        "order_payment": orderPayment,
        "order_address": orderAddress,
        "order_price": orderPrice,
        "order_coupon": orderCoupon,
        "order_status": orderStatus,
        "order_delivery_price": orderDeliveryPrice,
        "order_total_price": orderTotalPrice,
        "order_delivery": orderDelivery,
        "address_id": addressId,
        "user_address": userAddress,
        "address_name": addressName,
        "city": city,
        "street": street,
        "building": building,
        "apartment": apartment,
        "address_phone": addressPhone,
        "address_long": addressLong,
        "address_lat": addressLat,
        "address_type": addressType,
        "address_image": addressImage,
        "address_date": addressDate.toIso8601String(),
      };
}
