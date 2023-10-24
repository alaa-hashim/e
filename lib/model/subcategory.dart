class Subcategories {
  String? subId;
  String? subcatName;
  String? subcatNamear;
  String? image;
  String? catId;
  String? hide;
  int? categoryId;
  String? categoryName;
  String? categoryNamear;
  String? img;

  String? date;

  Subcategories(
      {this.subId,
      this.subcatName,
      this.subcatNamear,
      this.image,
      this.catId,
      this.hide,
      this.categoryId,
      this.categoryName,
      this.categoryNamear,
      this.img,
      this.date});

  Subcategories.fromJson(Map<String, dynamic> json) {
    subId = json['sub_id']?.toString();
    subcatName = json['subcat_name'];
    subcatNamear = json['subcat_namear'];
    image = json['image'];
    catId = json['cat_id'];
    hide = json['hide_'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNamear = json['category_namear'];
    img = json['img'];
    hide = json['hide'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_id'] = subId;
    data['subcat_name'] = subcatName;
    data['subcat_namear'] = subcatNamear;
    data['image'] = image;
    data['cat_id'] = catId;
    data['hide_'] = hide;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_namear'] = categoryNamear;
    data['img'] = img;
    data['hide'] = hide;
    data['date'] = date;
    return data;
  }
}
