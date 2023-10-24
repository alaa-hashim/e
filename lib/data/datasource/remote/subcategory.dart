import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class SubData {
  ApiHandler apihandler;
  SubData(this.apihandler);
  getData(String id, String st) async {
    var respone =
        await apihandler.postData(AppLink.home1, {"id": id, "st": st});
    return respone.fold((l) => l, (r) => r);
  }
}
