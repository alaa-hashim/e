class Product {
  String? productId;
  String? productName;
  String? proudctNamear;
  String? price;
  String? detail;
  String? detailsAr;
  String? proudctImg;
  int? subcatId;
  String? count;
  String? date;
  String? hide;
  String? productDiscount;
  String? proudctActive;
  String? subId;
  String? subcatName;
  String? subcatNamear;
  String? image;
  String? catId;
  String? wish;
  String? itemdiscount;
  Product(
      {this.productId,
      this.productName,
      this.proudctNamear,
      this.price,
      this.detail,
      this.detailsAr,
      this.proudctImg,
      this.subcatId,
      this.count,
      this.date,
      this.hide,
      this.productDiscount,
      this.proudctActive,
      this.subId,
      this.subcatName,
      this.subcatNamear,
      this.image,
      this.catId,
      this.wish,
      this.itemdiscount});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    proudctNamear = json['proudct_namear'];
    price = json['price'];
    detail = json['detail'];
    detailsAr = json['details_ar'];
    proudctImg = json['proudct_img'];
    subcatId = int.parse(json['subcat_id']);
    count = json['count'];
    date = json['date'];
    hide = json['hide'];
    productDiscount = json['product_discount'];
    proudctActive = json['proudct_active'];
    subId = json['sub_id'];
    subcatName = json['subcat_name'];
    subcatNamear = json['subcat_namear'];
    image = json['image'];
    catId = json['cat_id'];
    hide = json['hide_'];
    wish = json['wish'];
    itemdiscount = json['itemdiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId.toString();
    data['product_name'] = productName;
    data['proudct_namear'] = proudctNamear;
    data['price'] = price;
    data['detail'] = detail;
    data['details_ar'] = detailsAr;
    data['proudct_img'] = proudctImg;
    data['subcat_id'] = subcatId;
    data['count'] = count;
    data['date'] = date;
    data['hide'] = hide;
    data['product_discount'] = productDiscount;
    data['proudct_active'] = proudctActive;
    data['sub_id'] = subId;
    data['subcat_name'] = subcatName;
    data['subcat_namear'] = subcatNamear;
    data['image'] = image;
    data['cat_id'] = catId;
    data['hide_'] = hide;
    data['wishlist'] = wish;
    data['itemdiscount'] = itemdiscount;

    return data;
  }
}
