import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/services/auth_provider.dart';
import 'package:project/services/landing_provider.dart';
import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    LandingProvider provider = Provider.of<LandingProvider>(context);
    AuthProvider provider2 = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider<LandingProvider>(
      create: (context) => LandingProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                  controller: provider.pageController,
                  onPageChanged: provider.onPageViewChange,
                  itemCount: provider.onBoardingPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Image.network(
                                provider.onBoardingPages[index].image),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 40, right: 40, bottom: 40),
                            child: Text(
                              provider.onBoardingPages[index].title,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff7D7D7D)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Positioned.fill(
                bottom: 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        provider.onBoardingPages.length,
                            (index) => Container(
                          margin: EdgeInsets.all(20),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: provider.selectedPageIndex == index
                                ? Color(0xff4DC591)
                                : Color(0xffDDDDDD),
                          ),
                        )),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 60,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      bool check = provider.changeController();
                      if (check == true) {
                        provider2.registerUser();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => RegisterPage()),
                        // );
                      }
                    },
                    child: Container(
                      width: 140,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff4DC591),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                          child: Text(
                            provider.isLastPage() ? 'Get Started' : 'Skip',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}