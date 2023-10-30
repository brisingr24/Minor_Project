import 'package:flutter/material.dart';
import 'package:project/pre_auth/landing.dart';
import 'package:project/pre_auth/splash.dart';
import 'package:project/pre_auth/wrapper.dart';
import 'package:project/services/google_sign.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth/register.dart';
import 'models/userModel.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>GoogleSignInProvider()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var auth = FirebaseAuth.instance;
  // var isLogged = false;
  //
  // checkIfLogin() async{
  //   auth.authStateChanges().listen((User? user) {
  //     if(user!=null && mounted){
  //       setState(() {
  //         isLogged=true;
  //       });
  //     }
  //   });
  // }
  //
  // @override
  // void initState(){
  //   checkIfLogin();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: GoogleSignInProvider().user,
      initialData: UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        supportedLocales: [Locale('en', 'IN')],
      ),
    );
  }
}
