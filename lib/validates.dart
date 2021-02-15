import 'package:fluttertoast/fluttertoast.dart';

addTransceiver(pc, type, options) {}

bool emailCheck(String text) {
  return text.length > 8 &&
      !text.startsWith(" ");
}

bool nameCheck(String text) {
  return text.length > 3;
}

bool passwordCheck(String text) {
  return text.length > 5 &&
      !text.startsWith(" ");
}

bool phoneCheck(String text) {
  return text.length >= 10 &&
      !text.startsWith(" ");
}

bool ageCheck(String text) {
  return text.length >= 1 &&
      !text.startsWith(" ");
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}
