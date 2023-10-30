// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../../models/userModel.dart';
import '../profile_pages/edit_profile.dart';
import '../services/user_service.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final Stream<UserModel?> userModelStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 70),
              Text(
                "My Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),
              Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Color(0xFFFFF5E4),
                    height: 80,
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 180),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 150,
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF5E4),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: StreamBuilder<UserModel?>(
                    stream: UserService().getUserInfo(widget.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          UserModel user = snapshot.data!;
                          return Column(
                            children: [
                              user.profileImgURL == null
                                  ? CircleAvatar(
                                child: Image.asset(
                                  "images/userdef.png",
                                ),
                                radius: 60,
                                backgroundColor: Colors.white,
                              )
                                  : CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(
                                  user.profileImgURL ?? ' ',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${user.name}',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  user.age != null
                                      ? Text(
                                    '${user.age} years |',
                                    style: TextStyle(fontSize: 18),
                                  )
                                      : SizedBox(
                                    width: 1,
                                  ),
                                  user.gender != null
                                      ? Text(
                                    '${user.gender}',
                                    style: TextStyle(fontSize: 18),
                                  )
                                      : SizedBox(
                                    width: 1,
                                  ),
                                ],
                              ),
                              user.city != null
                                  ? Text(
                                '${user.city}',
                                style: TextStyle(fontSize: 18),
                              )
                                  : SizedBox(
                                height: 1,
                              ),
                            ],
                          );
                        }
                      }
                      return loadingView();
                    },
                  ),
                ),
              ]),
              Container(
                width: 350,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF5E4),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0), bottom: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Text(
                            "EDIT DETAILS",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile()),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingView() => Center(
    child: CircularProgressIndicator(),
  );
}
