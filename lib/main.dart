import 'package:flutter/material.dart';
import 'package:project/pre_auth/splash.dart';
import 'package:project/pre_auth/wrapper.dart';
import 'package:project/services/google_sign.dart';
import 'package:project/pre_auth/landing.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/userModel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
        routes: {
          '/wrapper': (context) => Wrapper(),
        },
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'IN')],
      ),
    );
  }
}
