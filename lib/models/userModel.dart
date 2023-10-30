import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String? id;
  String? name;
  String? profileImgURL;
  String? city;
  String? age;
  String? gender;
  String? docID;
  String? booked;

  UserModel({this.id,this.name,this.profileImgURL,this.city,this.gender,this.age,this.docID,this.booked}){
    notifyListeners();
  }
}