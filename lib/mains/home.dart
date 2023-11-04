import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/profile_pages/booking_pages/my_doc.dart';
import 'package:project/profile_pages/journal_pages/journal.dart';
import 'package:project/widgets/self_care.dart';
import '../auth/register.dart';
import '../models/userModel.dart';
import '../services/user_service.dart';
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
  ];

  List<String> navImg = [
    'images/self_care.png',
    'images/journ.png',
    'images/myDoc.png',
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFadeff7),
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Pacifico', fontSize: 25,fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          TextButton.icon(
              label: const Text(
                "Log Out",
                style: TextStyle(color: Colors.black,fontSize: 16),
              ),
              icon: const Icon(
                Icons.logout,
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
              StreamBuilder<UserModel?>(
                stream: UserService().getUserInfo(widget.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      UserModel user = snapshot.data!;
                      return Row(
                        children: [
                          user.profileImgURL == null
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    "images/userdef.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    user.profileImgURL ?? ' ',
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              '${user.name}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
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
                      );
                    }
                  }
                  return const Center();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Discover',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (() {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelfCare(),
                                ),
                              );
                            }
                            else
                            if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Journal(widget.uid),
                                ),
                              );
                            }
                            else
                            if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyDoc(uid: widget.uid),
                                ),
                              );
                            }
                          }),
                          child: CategoryItem(
                              item: navItem[index],
                              img: navImg[index],
                              index: index));
                    }),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    'Good Morning!!!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    height: 125,
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
                              moodScore: 1,
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
                              moodScore: 2,
                            )),
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
                              image: "images/3 emoji.png",
                              moodScore: 3,
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
                              image: "images/4 emoji.png",
                              moodScore: 4,
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
                              image: "images/5 emoji.png",
                              moodScore: 5,
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
