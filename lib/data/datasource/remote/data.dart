import 'package:get/get.dart';

import '../../../core/class/apihandler.dart';
import '../../../links.dart';

class Homedata {
  ApiHandler apihandler;
  Homedata(
    this.apihandler,
  );
 
  getData(
      String st,
      Map data,
      ) async {
    data["st"]=st;
    var respone = await apihandler.postData(AppLink.test,data);
    return respone.fold((l) => l, (r) => r);
  }

  redirect(String route ,Map? arguments) {
    Get.toNamed(route, arguments: arguments);
  }
  
}
