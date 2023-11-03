// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:project/pre_auth/wrapper.dart';
import 'package:project/pre_auth/landing.dart';
import '../models/shared_pref.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _jumpHome();
  }

  _jumpHome() async {
    SharedPref sharedPref = SharedPref();
    final bool? firstLogin = await sharedPref.getFirstLogin();
    await Future.delayed(const Duration(seconds: 3), () {});
    if (firstLogin == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Wrapper(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeae0d4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Image.asset("images/calm_girl.gif"),
          ),
          const SizedBox(height: 25),
          DefaultTextStyle(
              style: TextStyle(
                  fontSize: 50, color: Colors.green, fontFamily: 'Pacifico'),
              child: const Text("Serenity")),
        ],
      ),
    );
  }
}
