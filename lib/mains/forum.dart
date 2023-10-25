import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Forum extends StatefulWidget {
  const Forum({super.key, required String uid});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {

  _callNumber() async {
    const number = '+91913671171'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Forum"),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "images/userdef.png",
                    height: 50,
                    width: 50,
                  ),
                  backgroundColor: Colors.white,
                ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'User',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                      onPressed: _callNumber,
                      child: const Text(
                        "Panic",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(6.0),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.black),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(80, 16)),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}