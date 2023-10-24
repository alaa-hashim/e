// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  String addressId;
  String userAddress;
  String addressName;
  String city;
  String street;
  String building;
  String apartment;
  String adressPhone;
  String addressLag;
  String addressLat;
  String addressImage;
  DateTime addressDate;
  int addressType;

  Address(
      {required this.addressId,
      required this.userAddress,
      required this.addressName,
      required this.city,
      required this.street,
      required this.building,
      required this.apartment,
      required this.adressPhone,
      required this.addressLag,
      required this.addressLat,
      required this.addressDate,
      required this.addressImage,
      required this.addressType});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
      addressId: json["address_id"],
      userAddress: json["user_address"],
      addressName: json["address_name"],
      city: json["city"],
      street: json["street"],
      building: json["building"],
      apartment: json["apartment"],
      adressPhone: json["address_phone"],
      addressLag: json["address_long"],
      addressLat: json["address_lat"],
      addressImage: json["address_image"],
      addressDate: DateTime.parse(json["address_date"]),
      addressType: int.parse(json["address_type"]!));

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "user_address": userAddress,
        "address_name": addressName,
        "city": city,
        "street": street,
        "building": building,
        "apartment": apartment,
        "address_phone": adressPhone,
        "address_long": addressLag,
        "address_lat": addressLat,
        "address_date":
            "${addressDate.year.toString().padLeft(4, '0')}-${addressDate.month.toString().padLeft(2, '0')}-${addressDate.day.toString().padLeft(2, '0')}",
        "address_type": addressType,
      };
}
