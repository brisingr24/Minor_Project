import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/userModel.dart';


class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(id: user.uid,name: user.displayName) : null;
  }

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future googleLogin() async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null)return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );

    var res = await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    var currentUser = res.user;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .set({'id':currentUser.uid,'name':currentUser.displayName});

    return _userFromFirebaseUser(currentUser);
  }

  Future logOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}