import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 40),),
      ),
    );
  }
}