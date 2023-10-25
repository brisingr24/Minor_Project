import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/landingModel.dart';

class LandingProvider extends ChangeNotifier
{
  List<LandingModel> onBoardingPages = [
    LandingModel('https://img.freepik.com/free-vector/relaxed-woman-meditating_23-2148525630.jpg?size=338&ext=jpg','“Within you, there is a stillness and a sanctuary to which you can retreat at any time and be yourself.” - Hermann Hesse'),
    LandingModel('https://img.freepik.com/free-vector/relaxed-woman-meditating_23-2148525630.jpg?size=338&ext=jpg','“Feelings come and go like clouds in a windy sky. Conscious breathing is my anchor.” - John'),
    LandingModel('https://img.freepik.com/free-vector/relaxed-woman-meditating_23-2148525630.jpg?size=338&ext=jpg','“Calmness is the cradle of power.” - Josiah Gilbert Holland'),
  ];

  var selectedPageIndex = 0;
  var pageController = PageController();


  onPageViewChange(int page) {
    selectedPageIndex = page;
    notifyListeners();
  }

  changeController(){
    if(isLastPage()){
      return true;
      //************************************************************** add home screen*************************************************************
    }else {
      pageController.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
      notifyListeners();
    }
  }

  bool isLastPage(){
    if(selectedPageIndex == onBoardingPages.length-1 )
      return true;
    return false;
  }

}