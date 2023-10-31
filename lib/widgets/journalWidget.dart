import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget JournCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.amber.shade200,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(doc["note_title"],
                  style: const TextStyle(
                      fontFamily: 'secular',
                      fontSize: 20,
                      fontWeight: FontWeight.w300))),
          const SizedBox(
            height: 70,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(doc["creation_date"],
                  style: const TextStyle(
                      fontFamily: 'secular',
                      fontSize: 16,
                      fontWeight: FontWeight.w100))),
        ],
      ),
    ),
  );
}
