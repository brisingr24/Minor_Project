import 'package:flutter/material.dart';

class MoodItem extends StatefulWidget {
  const MoodItem({Key? key, required this.image, required this.moodScore}) : super(key: key);
  final String image;
  final int moodScore;

  @override
  State<MoodItem> createState() => _MoodItemState();
}

class _MoodItemState extends State<MoodItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: 80,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                widget.image,
                height: 80,
                width: 90,
              ),
            )
          ],
          // children: [Image.asset(widget.image,height:60,fit:BoxFit.contain,)],
        ));
  }
}
