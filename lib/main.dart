import 'package:flutter/material.dart';
import 'package:flutter_eventboard/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


//this funciton is just for testing firebase functions.
void test() {
  Firestore.instance.collection('events').snapshots().listen((data) =>
      data.documents.forEach((doc) => print(doc["event_title"])));
}


void main() {
  //test();
  runApp(
      new EventboardApp(),
    );
}