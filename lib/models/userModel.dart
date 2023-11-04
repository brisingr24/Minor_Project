import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {

  String? id;
  String? profileImgURL;
  String? name;
  String? email;
  String? city;
  String? age;
  String? gender;
  String? docID;
  String? date;
  String? time;
  bool? booked;

  UserModel({this.id, this.profileImgURL, this.name, this.email,this.city,this.age,this.gender,this.booked,this.docID,this.date,this.time}){
    notifyListeners();
  }
}