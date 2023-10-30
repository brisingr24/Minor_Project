import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String? id;
  String? name;
  String? profileImgURL;
  String? city;
  String? age;
  String? gender;

  UserModel({this.id,this.name,this.profileImgURL,this.city,this.gender,this.age}){
    notifyListeners();
  }
}