import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class ResetPassword {
  ApiHandler apihandler;
  ResetPassword(this.apihandler);
  postData(String email, String password , String st) async {
    var respone = await apihandler
        .postData(AppLink.home1, { "email":email,  "password":password , "st":st});
    return respone.fold((l) => l, (r) => r);
  }
}
