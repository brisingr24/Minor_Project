import 'package:flutter/material.dart';
import 'package:project/pre_auth/questionnaire.dart';
import 'package:project/pre_auth/wrapper.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/shared_pref.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLastPage = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 3;

    return MaterialApp(
        title: 'Page view dot indicator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  if (index == 2) {
                    isLastPage = true;
                  } else {
                    isLastPage = false;
                  }
                });
              },
              children: [
                Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 35),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                          height: 280.0,
                          width: 280.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/landing1.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(children: const [
                          SizedBox(width: 20),
                          Text(
                            'Did you know?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ]),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: ReadMoreText(
                            'More than 700,000 people die by suicide every year. Suicide accounts for 1 in 100 deaths globally. Suicide is the fourth leading cause of death in individuals aged 15-29 years.',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18),
                            trimLines: 2,
                            textAlign: TextAlign.left,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Show More',
                            trimExpandedText: 'Show Less',
                            moreStyle: (TextStyle(
                                color: Colors.blue,
                                fontSize: 16
                            )),
                            lessStyle: (TextStyle(
                              color: Colors.blue,
                            )),
                          ),
                        ),
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 35),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                          height: 280.0,
                          width: 280.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/landing2.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(children: const [
                          SizedBox(width: 20),
                          Text(
                            'What is Mental Health?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ]),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: ReadMoreText(
                            'Mental ‘Health’, as the phrase suggests, isn’t just the state of well-being but also the monitoring of the way you experience emotional and behavioural highs and lows, the soundness of your judgments and the amount of stress that your mind undergoes',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18),
                            trimLines: 2,
                            textAlign: TextAlign.left,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show More',
                            trimExpandedText: 'Show Less',
                            moreStyle: (TextStyle(
                              color: Colors.blue,
                              fontSize: 16
                            )),
                            lessStyle: (TextStyle(
                              color: Colors.blue,
                            )),
                          ),
                        ),
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 35),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                          height: 280.0,
                          width: 280.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/landing3.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(children: const [
                          SizedBox(width: 20),
                          Text(
                            'Mental Health Awareness',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ]),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: ReadMoreText(
                            'The importance of mental health cannot be overstated, and a healthy mind leads to a higher quality of life. When someone is struggling with mental health issues, such as depression,it can cause us to lose interest in the things we once enjoyed.The regular ups and downs of life overwhelm us to a point where we cannot carry on with even the most basic tasks.',
                            style: TextStyle(
                                color: Colors.black45,
                                wordSpacing: 0.25,
                                fontSize: 18),
                            trimLines: 2,
                            textAlign: TextAlign.left,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Show More',
                            trimExpandedText: 'Show Less',
                            moreStyle: (TextStyle(
                              color: Colors.blue,
                              fontSize: 16
                            )),
                            lessStyle: (TextStyle(
                              color: Colors.blue,
                            )),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          bottomSheet: isLastPage
              ? TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFadeff7),
                    minimumSize: const Size.fromHeight(80),
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                  ),
                  onPressed: () async {
                    SharedPref sharedPref = SharedPref();
                    await sharedPref.setFirstLogin(false);
                    final bool? firstLogin = await sharedPref.getFirstLogin();
                    print("hello" + firstLogin.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Question()),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFFF9494)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(100, 20)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: WormEffect(
                                spacing: 16,
                                dotColor: Colors.black26,
                                activeDotColor: Colors.teal.shade600),
                            onDotClicked: (index) => controller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFFF9494)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(100, 20)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
