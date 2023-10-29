import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String firstLogin = "FIRST_LOGIN";
  setFirstLogin(bool value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(firstLogin, value);
  }

  getFirstLogin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool(firstLogin);
  }
}