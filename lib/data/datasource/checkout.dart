import '../../core/class/apihandler.dart';
import '../../links.dart';

class CheckuotData {
  ApiHandler apihandler;
  CheckuotData(this.apihandler);
  addData(
    String tt,
    String userid,
    String addressid,
    String orderstype,
    String ordersprice,
    String couponid,
    String paymentmethod,
    String coupondiscount,
  ) async {
    var respone = await apihandler.postData(AppLink.home1, {
      "st": tt,
      "usersid": userid,
      "addressid": addressid,
      "pricedelivery": orderstype,
      "ordersprice": ordersprice,
      "couponid": couponid,
      "paymentmethod": paymentmethod,
      "coupondiscount": coupondiscount,
    });
    return respone.fold((l) => l, (r) => r);
  }
}
