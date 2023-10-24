import '../../../../core/class/apihandler.dart';
import '../../../../links.dart';

class SignData {
  ApiHandler apihandler;
  SignData(this.apihandler);
  postdata(String st, String email, String password, String username,
      String phone, String token) async {
    var response = await apihandler.postData(AppLink.home1, {
      "st": st,
      "email": email,
      "password": password,
      "user": username,
      "phone": phone,
      "token": token
    });
    return response.fold((l) => l, (r) => r);
  }
}
