import 'package:flutter/material.dart';

class SelfCare extends StatefulWidget {
  const SelfCare({super.key});

  @override
  State<SelfCare> createState() => _SelfCareState();
}

class _SelfCareState extends State<SelfCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 35
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text('Self Care Tips',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
