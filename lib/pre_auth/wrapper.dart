import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/pre_auth/pagehost.dart';
import '../auth/register.dart';
import '../mains/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {

              return PageHost();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something Went Wrong'),
              );
            } else {
              return const Register();
            }
          }),
    );
  }
}
