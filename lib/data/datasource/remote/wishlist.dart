import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class WishData {
  ApiHandler apihandler;
  WishData(this.apihandler);

  addData(String id, String st, String userid) async {
    var respone = await apihandler
        .postData(AppLink.home1, {"id": id, "st": st, "userid": userid});
    return respone.fold((l) => l, (r) => r);
  }

  deleteData(String id, String st, String userid) async {
    var respone = await apihandler
        .postData(AppLink.home1, {"id": id, "st": st, "userid": userid});
    return respone.fold((l) => l, (r) => r);
  }

  viewData(String st, String userid) async {
    var respone =
        await apihandler.postData(AppLink.home1, {"st": st, "userid": userid});
    return respone.fold((l) => l, (r) => r);
  }
}
