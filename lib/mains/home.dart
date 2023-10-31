import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/register.dart';
import '../widgets/category_widget.dart';
import '../models/quoteModel.dart';
import '../widgets/moodWidget.dart';
import '../widgets/mood_quote.dart';
import '../services/google_sign.dart';
import '../services/quote_api.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.uid});
  final String uid;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String quoteImage = "images/thought_placeholder.png";
  String? _category;
  QuotesApi quotesApi = QuotesApi();
  bool _ismoodvisible = true;
  bool _isquotevisible = false;
  List<String> navItem = [
    'Self Care',
    'My Journal ',
    'My Therapist',
    'My Music'
  ];

  _callNumber() async {
    const number = '+91913671171'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  final user = FirebaseAuth.instance.currentUser!;
  final GoogleSignInProvider _auth = GoogleSignInProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD1D1),
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Pacifico', fontSize: 25),
        ),
        actions: <Widget>[
          TextButton.icon(
              label: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.black),
              ),
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () async {
                _auth.logOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                      (route) => false,
                );
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "images/userdef.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('User',style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                        onPressed: _callNumber,
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(6.0),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(80, 16)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                        child: const Text(
                          "Panic",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Discover',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 85,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: navItem.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (() {
                            print(navItem);
                          }),
                          child: CategoryItem(item: navItem[index]));
                    }),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  'Good Morning!!!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'How are you feeling today?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: _ismoodvisible,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "courage";
                                quoteImage = "images/mehmoodquote.jpg";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: const MoodItem(
                              image: "images/1 emoji.png",
                              moodtext: "MEH",
                            )),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "failure";
                                quoteImage = "images/badmoodquote.jpg";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: const MoodItem(
                              image: "images/2 emoji.png",
                              moodtext: "BAD",
                            )),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "happiness";
                                quoteImage = "images/happymoodquote.jfif";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: const MoodItem(
                              image: "images/3 emoji.png",
                              moodtext: "GOOD",
                            )),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "inspirational";
                                quoteImage = "images/nicemoodquote.jpg";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: const MoodItem(
                              image: "images/4 emoji.png",
                              moodtext: "NICE",
                            )),
                      ],
                    )),
              ),
              Visibility(
                visible: _isquotevisible,
                child: FutureBuilder(
                  future: quotesApi.getdata(_category),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return const AlertDialog(
                        title: Text("Failed to load Data"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error
                      if (snapshot.hasError) {
                        return Center(
                            child: AlertDialog(
                              title: Text('${snapshot.error}'),
                            ));
                      } else if (snapshot.hasData) {
                        QuoteModel? quoteModel = snapshot.data as QuoteModel?;
                        // log(_category.toString()+" "+quoteModel!.category.toString());
                        return MoodQuote(
                          quote: quoteModel?.quote,
                          author: quoteModel?.author,
                        );
                      }
                    }
                    return const Center(
                        child: AlertDialog(
                          alignment: Alignment.center,
                          title: Text(
                            "Failed to load Data",
                            textAlign: TextAlign.center,
                          ),
                        ));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
