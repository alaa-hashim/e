import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class VerfiycodeFP {
  ApiHandler apihandler;
  VerfiycodeFP(this.apihandler);
  postData(String email, String verfiycode ,  String st) async {
    var respone = await apihandler
        .postData(AppLink.home1, { "email":email, "verifycode":verfiycode , "st":st});
    return respone.fold((l) => l, (r) => r);
  }
}
