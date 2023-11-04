import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/bar_graph/bar_chart.dart';
import 'package:project/models/date_time_helper.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';

class MoodSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const MoodSummary({super.key,required this.startOfWeek});
  
  @override
  Widget build(BuildContext context) {
  
  String sunday = convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
  String monday = convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
  String tuesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
  String wednesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
  String thursday = convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
  String friday = convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
  String saturday = convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<MoodData>(
      builder: (context,value,child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 100,
          sunAmount: value.calculateDailyMoodSummary()[sunday] ?? 0,
          monAmount: value.calculateDailyMoodSummary()[monday] ?? 0,
          tueAmount: value.calculateDailyMoodSummary()[tuesday] ?? 0,
          wedAmount: value.calculateDailyMoodSummary()[wednesday] ?? 0,
          thurAmount: 20,
          //thurAmount: value.calculateDailyMoodSummary()[thursday] ?? 0,
          friAmount: 60,
          //friAmount: value.calculateDailyMoodSummary()[friday] ?? 0,
          satAmount: value.calculateDailyMoodSummary()[saturday] ?? 0,
        ),
      )
    );
  }
}
