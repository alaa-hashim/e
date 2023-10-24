import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class ItemsData {
  ApiHandler apihandler;
  ItemsData(this.apihandler);
  getData(String id, String st, String userid) async {
    var respone = await apihandler
        .postData(AppLink.home1, {"id": id, "st": st, "userid": userid});
    return respone.fold((l) => l, (r) => r);
  }

  getRecommned(String id, String subid, String st) async {
    var respone = await apihandler
        .postData(AppLink.home, {"id": id, "st": st, "subid": id});
    return respone.fold((l) => l, (r) => r);
  }
}
