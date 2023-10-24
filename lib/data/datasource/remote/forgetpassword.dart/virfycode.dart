import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class VerfiycodeFP {
  ApiHandler apihandler;
  VerfiycodeFP(this.apihandler);
  postData(String email, String verfiycode) async {
    var respone = await apihandler
        .postData(AppLink.home, {email: "email", verfiycode: "verfycode"});
    return respone.fold((l) => l, (r) => r);
  }
}
