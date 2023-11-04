import 'package:flutter/cupertino.dart';
import 'package:project/models/date_time_helper.dart';
import 'package:project/models/hive_db.dart';
import 'moodModel.dart';


class MoodData extends ChangeNotifier{
  List<MoodItem> overallMoodList = [];

  List<MoodItem> getAllMoodList() {
    return overallMoodList;
  }

  final db = HiveDataBase();
  void prepareData(){
    if(db.readData().isNotEmpty){
      overallMoodList = db.readData();
    }
  }

  void addNewMood(MoodItem newMood) {
    overallMoodList.add(newMood);
    notifyListeners();
    db.saveData(overallMoodList);
  }

  void deleteNewMood(MoodItem newMood) {
    overallMoodList.remove(newMood);
    notifyListeners();
    db.saveData(overallMoodList);
  }

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  DateTime startOfWeekDate() {
    DateTime? startOfWeek;
    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String,double> calculateDailyMoodSummary(){
    Map<String,double> dailyMoodSummary = {
      
    };
    
    for(var mood in overallMoodList){
      String date = convertDateTimeToString(mood.dateTime);
      double amount = double.parse(mood.amt);

      if(dailyMoodSummary.containsKey(date)){
        double currentAmount = dailyMoodSummary[date]!;
        currentAmount +=amount;
        dailyMoodSummary[date] = currentAmount;
      } else {
        dailyMoodSummary.addAll({date:amount});
      }
    }
    return dailyMoodSummary;
  }
}
