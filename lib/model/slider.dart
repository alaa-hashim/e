class Sliders {
  String? id;
  String? name;
  String? nameAr;
  String? img;
  String? date;
  String? hide;

  Sliders({this.id, this.name, this.nameAr, this.img, this.date, this.hide});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    img = json['img'];
    date = json['date'];
    hide = json['hide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['img'] = img;
    data['date'] = date;
    data['hide'] = hide;
    return data;
  }
}
