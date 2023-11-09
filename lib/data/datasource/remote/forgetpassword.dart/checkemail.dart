import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class CheckemailD {
  ApiHandler apihandler;
  CheckemailD(this.apihandler);
  getemail(String email ,String st) async {
    var respone = await apihandler.postData(AppLink.home1, { "email":email ,"st":st});
    return respone.fold((l) => l, (r) => r);
  }
}
