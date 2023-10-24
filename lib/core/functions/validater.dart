import 'package:get/get.dart';

inputvalidater(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return " Not vaild username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return " Not vaild email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return " Not vaild phone number";
    }
  }
  if (val.isEmpty) {
    return "this value cant be empty";
  }
  if (val.length < min) {
    return " the field cant be less then $min ";
  }
  if (val.length > max) {
    return " the field cant be large  then $max ";
  }
}
