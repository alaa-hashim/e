// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

List<Images> imagesFromJson(String str) =>
    List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));



class Images {
  String imageId;
  String itemId;
  String imageName;
  String imageHide;
  DateTime imageDate;

  Images({
    required this.imageId,
    required this.itemId,
    required this.imageName,
    required this.imageHide,
    required this.imageDate,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageId: json["id"] ?? "", // Provide a default value if it's null
        itemId: json["item_id"] ?? "", // Provide a default value if it's null
        imageName:
            json["image_name"] ?? "", // Provide a default value if it's null
        imageHide:
            json["hide"] ?? "", // Provide a default value if it's null
        imageDate: json["image_date"] != null
            ? DateTime.parse(json["image_date"])
            : DateTime.now(), // Provide a default date if it's null
      );

  
}
