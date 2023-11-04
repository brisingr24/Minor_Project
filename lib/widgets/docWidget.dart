import 'package:flutter/material.dart';

import '../profile_pages/booking_pages/booking_screen.dart';

// ignore: must_be_immutable
class Contact extends StatefulWidget {
  Contact(
      {Key? key,
        required this.docID,
        required this.uid,
        this.name,
        this.profession,
        this.city,
        this.rating})
      : super(key: key);
  String docID;
  String uid;
  String? name;
  String? profession;
  String? city;
  String? rating;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: 170,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.shade50,
                    radius: 30,
                    child: Image.asset("images/myDoc.png"),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "${widget.name}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "${widget.profession}",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9494),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${widget.city}"),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFF9494),
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.rating}"),
                          const Icon(Icons.star),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                          docID: widget.docID,
                          uid: widget.uid,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFF9494)),
                  ),
                  child: const Text("Book Now"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
