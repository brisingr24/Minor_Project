import 'package:flutter/material.dart';

class MoodWidget extends StatefulWidget {
  const MoodWidget({Key? key, required this.image, required this.moodScore}) : super(key: key);
  final String image;
  final int moodScore;

  @override
  State<MoodWidget> createState() => _MoodWidgetState();
}

class _MoodWidgetState extends State<MoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: 60,
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                widget.image,
                height: 60,
                width: 80,
              ),
            )
          ],
          //children: [Image.asset(widget.image,)],
        ));
  }
}
