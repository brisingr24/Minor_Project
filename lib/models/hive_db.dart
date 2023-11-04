import 'package:hive_flutter/hive_flutter.dart';

import 'moodModel.dart';


class HiveDataBase{
  final _myBox = Hive.box('mood_database');
  void saveData(List<MoodItem> allMood){

    List<List<dynamic>> allMoodFormatted = [];

    for (var mood in allMood) {
      List<dynamic> moodFormatted = [
        mood.mood,
        mood.amt,
        mood.dateTime,
      ];
      allMoodFormatted.add(moodFormatted);
    }
    _myBox.put("ALL_MOOD",allMoodFormatted);
  }

  List<MoodItem> readData(){

    List savedMood = _myBox.get("ALL_MOOD")??[];
    List<MoodItem> allMood = [];

    for(int i=0;i<savedMood.length;i++){
      String name = savedMood[i][0];
      String amount = savedMood[i][1];
      DateTime dateTime = savedMood[i][2];

      MoodItem moods = MoodItem(mood: name, amt: amount, dateTime: dateTime);

      allMood.add(moods);
    }
    return allMood;
  }
}