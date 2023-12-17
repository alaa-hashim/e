class Sliders {
  String? id;
  String? name;
  String? nameAr;
  String? img;
  String? date;
  String? hide;

  Sliders({this.id, this.name, this.nameAr, this.img, this.date, this.hide});


  factory Sliders.fromJson(Map<String, dynamic> json) {
    return Sliders(
        id :json['id'],
        name :json['name'],
        nameAr:json['name_ar'],
    img :json['img'],
    date :json['date'],
    hide : json['hide']
    );
  }

}
