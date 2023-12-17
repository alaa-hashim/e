// ignore_for_file: prefer_collection_literals

class General {
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? catDate;

  General(
      {this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.catDate});


  factory General.fromJson(Map<String, dynamic> json) {
    return General(
    categoryId : json['category_id']?.toString(),
    categoryName : json['category_name'],
    categoryNameAr : json['category_namear'],
    categoryImage : json['img'],
    catDate : json['cat_date']
    );
  }
}
