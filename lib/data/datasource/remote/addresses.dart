import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class AddressData {
  ApiHandler apihandler;
  AddressData(this.apihandler);
  addData(
    String st,
    String userid,
    String name,
    String city,
    String street,
    String building,
    String apartment,
    String phone,
    String long,
    String lat,
    String type,
    String image,
  ) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "st": st,
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "building": building,
      "apartment": apartment,
      "phone": phone,
      "lag": long,
      "lat": lat,
      "type": type,
      "image": image,
    });
    return respone.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var respone = await apihandler.postData(AppLink.home, {});
    return respone.fold((l) => l, (r) => r);
  }

  getcountData(Map data) async {
    var respone = await apihandler.postData(AppLink.home, {});
    return respone.fold((l) => l, (r) => r);
  }

  viewData(String st, String userid) async {
    var respone =
        await apihandler.postData(AppLink.home1, {"st": st, "userid": userid});
    return respone.fold((l) => l, (r) => r);
  }
}
