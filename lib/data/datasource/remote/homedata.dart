import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class Homedata {
  ApiHandler apihandler;
  Homedata(
    this.apihandler,
  );
  getsearch(String sr, String search) async {
    var respone =
        await apihandler.postData(AppLink.home1, {"st": sr, "search": search});
    return respone.fold((l) => l, (r) => r);
  }

  getSlider(
    String ss,
  ) async {
    var respone = await apihandler.postData(AppLink.home, {
      "st": ss,
    });
    return respone.fold((l) => l, (r) => r);
  }

  postData(String st) async {
    var respone = await apihandler.postData(AppLink.home, {"st": st});
    return respone.fold((l) => l, (r) => r);
  }

  getData(String ts, String id) async {
    var respone =
        await apihandler.postData(AppLink.home, {"st": ts, "userid": id});
    return respone.fold((l) => l, (r) => r);
  }

  getDisc(
    String tt,
  ) async {
    var respone = await apihandler.postData(AppLink.home, {
      "st": tt,
    });
    return respone.fold((l) => l, (r) => r);
  }

  getSub(String su) async {
    var respone = await apihandler.postData(AppLink.home, {
      "st": su,
    });
    return respone.fold((l) => l, (r) => r);
  }

  viewData(String tr, String userid) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "st": tr,
      "id": userid,
    });
    return respone.fold((l) => l, (r) => r);
  }

  insertData(String tr, String userid, String itemid) async {
    var respone = await apihandler
        .postData(AppLink.home1, {"st": tr, "id": userid, "itemid": itemid});
    return respone.fold((l) => l, (r) => r);
  }

  editData(String tr, String userid, String username, String email,
      String phone) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "st": tr,
      "id": userid,
      "username": username,
      "email": email,
      "phone": phone
    });
    return respone.fold((l) => l, (r) => r);
  }

  getimage(
    String id,
    String st,
  ) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "id": id,
      "st": st,
    });
    return respone.fold((l) => l, (r) => r);
  }

  getrecommed(String tr, String itemid, String subcat) async {
    var respone = await apihandler
        .postData(AppLink.home1, {"st": tr, "id": itemid, "subid": subcat});
    return respone.fold((l) => l, (r) => r);
  }
   getemail(String email ,String st) async {
    var respone = await apihandler.postData(AppLink.home1, {email: "email" ,st:"st"});
    return respone.fold((l) => l, (r) => r);
  }
  viewitems(String tr, String userid) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "st": tr,
      "userid": userid,
    });
    return respone.fold((l) => l, (r) => r);
  }
}
