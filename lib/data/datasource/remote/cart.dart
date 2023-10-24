import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class CartData {
  ApiHandler apihandler;
  CartData(this.apihandler);
  addData(String userid, String itemid, String td, String count) async {
    var respone = await apihandler.postData(AppLink.home1,
        {"userid": userid, "itemid": itemid, "st": td, "count": count});
    return respone.fold((l) => l, (r) => r);
  }

  deleteData(String userid, String itemid, String dd) async {
    var respone = await apihandler.postData(
        AppLink.home1, {"userid": userid, "itemid": itemid, "st": dd});
    return respone.fold((l) => l, (r) => r);
  }

  addQ(String userid, String itemid, String aq) async {
    var respone = await apihandler.postData(
        AppLink.home1, {"userid": userid, "itemid": itemid, "st": aq});
    return respone.fold((l) => l, (r) => r);
  }

  removeQ(String userid, String itemid, String rq) async {
    var respone = await apihandler.postData(
        AppLink.home1, {"userid": userid, "itemid": itemid, "st": rq});
    return respone.fold((l) => l, (r) => r);
  }

  getcountData(String userid, String itemid, String tg) async {
    var respone = await apihandler.postData(
        AppLink.home1, {"userid": userid, "itemid": itemid, "st": tg});
    return respone.fold((l) => l, (r) => r);
  }

  viewData(String st, String userid) async {
    var respone =
        await apihandler.postData(AppLink.home1, {"st": st, "userid": userid});
    return respone.fold((l) => l, (r) => r);
  }

  coupon(String id) async {
    var respone = await apihandler.postData(AppLink.test, {"id": id});
    return respone.fold((l) => l, (r) => r);
  }
}
