import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// event card model class
class Event {
  String name;
  String title;
  String eventSummary;
  String location;
  String date;

  Event(name, title, eventSummary, location, date) {
    this.name = name;
    this.title = title;
    this.eventSummary = eventSummary;
    this.location = location;
    this.date = date;
  }

  Future<Event> getEvents() async {
    Firestore.instance.collection('events').snapshots().listen((data) =>
        data.documents.forEach((doc) => this.name = (doc["event_creator_id"])));
  }
}
