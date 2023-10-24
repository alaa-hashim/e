import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class ResetPassword {
  ApiHandler apihandler;
  ResetPassword(this.apihandler);
  postData(String email, String password) async {
    var respone = await apihandler
        .postData(AppLink.home, {email: "email", password: "password"});
    return respone.fold((l) => l, (r) => r);
  }
}
