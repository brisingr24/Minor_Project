import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/userModel.dart';
import '../../services/user_service.dart';

class MyDoc extends StatefulWidget {
  const MyDoc({super.key,required this.uid});
  final String uid;
  @override
  State<MyDoc> createState() => _MyDocState();
}

class _MyDocState extends State<MyDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 35,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text("My Bookings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
            const SizedBox(height: 30,),
            StreamBuilder<UserModel?>(
                stream: UserService().getUserInfo(widget.uid),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Text("Book Your First Appointment!"));
                  }
                  var data = snapshot.data;
                  if (data == null) {
                    return Center(child: Text("No data"));
                  }

                  if (data.booked == true) {
                    return StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("doctor")
                          .doc(data.docID)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          var data2 = snapshot.data;
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                BorderRadius.circular(10.0),
                              ),
                              height: 160,
                              width: 350,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Doctor Name: ${data2!["name"]}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Profession: ${data2["job"]}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Rating: ${data2["rate"]}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Appointment Date: ${data.date}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Appointment Time: ${data.time} AM",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return Text(
                          "There's No Bookings yet!",
                          style: TextStyle(
                              fontSize: 15, color: Colors.black54),
                        );
                      },
                    );
                  } else {
                    return Center(
                        child: Text("Book Your First Appointment!"));
                  }
                }),
            const SizedBox(height: 30,),
            Image.asset('images/discover_therapist.png',height: 300,)
          ],
        ),
      ),
    );
  }
}
