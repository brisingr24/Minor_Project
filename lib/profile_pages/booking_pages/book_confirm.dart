// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../../models/userModel.dart';
import '../../services/user_service.dart';

// ignore: must_be_immutable
class BookingConfirm extends StatelessWidget {
  BookingConfirm({Key? key, required this.uid, required this.docID})
      : super(key: key);
  String docID;
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFF5E4),
        body: Center(
          child: SizedBox(
            width: 350,
            height: 465,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 25, 0, 10),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                      ExactAssetImage('images/confirmation.gif'),
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                              SizedBox(height: 60),
                              StreamBuilder<UserModel?>(
                                  stream: UserService().getUserInfo(uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data != null) {
                                        UserModel user = snapshot.data!;
                                        return Text(
                                          'Hey ${user.name}',
                                          style: TextStyle(fontSize: 20),
                                        );
                                      } else {
                                        return Center();
                                      }
                                    } else {
                                      return Center();
                                    }
                                  }),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Your Booking has been confirmed!',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                      "BACK TO",
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.black54),
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFF9494)),
                        overlayColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.pinkAccent,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text("HOME"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/wrapper');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
