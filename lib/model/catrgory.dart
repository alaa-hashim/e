// ignore_for_file: prefer_collection_literals

class Category {
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? catDate;

  Category(
      {this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.catDate});


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
    categoryId : json['id']?.toString(),
    categoryName : json['name'],
    categoryNameAr : json['namear'],
    categoryImage : json['img'],
    catDate : json['cat_date']
    );
  }
}
