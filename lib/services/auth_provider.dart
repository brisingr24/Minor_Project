import 'package:flutter/cupertino.dart';

enum AuthStates {autoLogin,authenticated,unAuthenticated,newUser}

class AuthProvider extends ChangeNotifier {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  String userName = "yo";
  String password = "yo";
  bool isPasswordVisible = false;
  bool hasSpecialCharacters = false;
  bool isLoadingAnimation = true;
  final newText = TextEditingController();

  void showPass() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  var states = AuthStates.unAuthenticated;
  bool check = true;

  AuthProvider(){
    autoLogin();
  }

  autoLogin() async{
    states = AuthStates.autoLogin;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    try{
      if(check == true)
        states = AuthStates.newUser;
    }
    catch(e){
      print(e);
    }
    notifyListeners();
  }

  registerUser() {
    try{
      if(check == true)
        states = AuthStates.unAuthenticated;
    }
    catch(e){
      print(e);
    }
    notifyListeners();
  }

  loginUser() {
    try{
      if(check == true)
        states = AuthStates.authenticated;
    }
    catch(e){
      print(e);
    }
    notifyListeners();
  }
}