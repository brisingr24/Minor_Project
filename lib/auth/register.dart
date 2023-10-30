import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pre_auth/wrapper.dart';
import '../services/google_sign.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text("Register"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Align(alignment: Alignment.centerLeft,child: Text('Hey There,',style: TextStyle(fontSize: 40,color: Colors.white),)),
                  Text('Welcome Back',style: TextStyle(fontSize: 40,color: Colors.white),),
                  SizedBox(height: 50,),
                  ElevatedButton.icon(
                      style:ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity,50)),
                      onPressed: () async {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Wrapper()));
                        //provider.change();
                      },
                      icon: Icon(Icons.login),
                      label: const Text("Log In with Google")),
                  SizedBox(height: 20,),
                  ElevatedButton.icon(
                      style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity,50)),
                      onPressed: () async {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleSignUp();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Wrapper()));
                        //provider.change();
                      },
                      icon: Icon(Icons.login,color: Colors.black,),
                      label: const Text("Sign Up with Google",style: TextStyle(color: Colors.black),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
