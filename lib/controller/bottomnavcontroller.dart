import 'package:get/get.dart';

class BottomNavigationBarContorller extends GetxController {
  var tabIndex = 0;
  void changeTabindex(int index) {
    tabIndex = index;
    update();
  }
}
