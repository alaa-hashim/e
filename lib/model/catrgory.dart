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

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id']?.toString();
    categoryName = json['category_name'];
    categoryNameAr = json['category_namear'];
    categoryImage = json['img'];
    catDate = json['cat_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_namear'] = categoryNameAr;
    data['img'] = categoryImage;
    data['cat_date'] = catDate;
    return data;
  }
}
