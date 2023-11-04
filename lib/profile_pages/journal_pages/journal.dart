// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/journalWidget.dart';
import 'journal_add.dart';
import 'journal_edit.dart';

class Journal extends StatefulWidget {
  Journal(this.uid, {Key? key}) : super(key: key);
  String uid;
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E4),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 35
        ),
        backgroundColor: Color(0xFFFFF5E4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: const Text('My Journal',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500))),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.uid)
                    .collection("journal")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => JournCard(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JournalEdit(
                                  note, widget.uid, note.id)),
                        );
                      }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "There's No Notes",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFF9494),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JournalAdd(widget.uid)),
          );
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
