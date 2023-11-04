import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/services/utils_serivce.dart';
import '../models/userModel.dart';

class UserService{

  UtilsService _utilsService = UtilsService();

  UserModel? _userFromFirebaseSnapshot(DocumentSnapshot<dynamic> snapshot){
    return snapshot != null
        ?UserModel(
      id: snapshot.id,
      profileImgURL: snapshot.data()['profileImgURL'],
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      city: snapshot.data()['city'],
      age: snapshot.data()['age'],
      gender: snapshot.data()['gender'],
      docID: snapshot.data()['docID'],
      booked: snapshot.data()['booked'],
      date: snapshot.data()['date'],
      time: snapshot.data()['time'],
    ) :UserModel(name:"User");
  }

  Stream<UserModel?> getUserInfo(uid){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_userFromFirebaseSnapshot);
  }

  Future <void> updateProfile (String name,String city,String age,String gender) async {

    Map<String,Object> data = HashMap();
    if (name != '') data['name'] = name;
    if (city != '') data['city'] = city;
    if (age != '') data['age'] = age;
    if (gender != '') data['gender'] = gender;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update(data);
  }

  Future <void> updatePic (File _profileImg) async {

    String profileImgURL = "";

    if(_profileImg != null){
      //save image to storage
      profileImgURL = await _utilsService.uploadFile(_profileImg,'user/profile/${FirebaseAuth.instance.currentUser?.uid}/profile');
    }

    Map<String,Object> data = HashMap();
    if (profileImgURL != '') data['profileImgURL'] = profileImgURL;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update(data);
  }
}