import 'package:flutter/material.dart';

class MoodTile extends StatelessWidget {
  const MoodTile({super.key,required this.name,required this.amount,required this.dateTime});
  final String name;
  final String amount;
  final DateTime dateTime;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
      trailing: Text(amount),
    );
  }
}
