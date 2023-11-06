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

  getItems(String id, String st) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "userid": id,
      "st": st,
    });
    return respone.fold((l) => l, (r) => r);
  }
}
