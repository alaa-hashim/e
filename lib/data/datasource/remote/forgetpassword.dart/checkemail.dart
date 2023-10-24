import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class CheckemailD {
  ApiHandler apihandler;
  CheckemailD(this.apihandler);
  postData(String email) async {
    var respone = await apihandler.postData(AppLink.home, {email: "email"});
    return respone.fold((l) => l, (r) => r);
  }
}
