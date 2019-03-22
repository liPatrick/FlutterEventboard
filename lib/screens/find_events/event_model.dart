import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// event card model class
class Event {
  String name;
  String title;
  String eventSummary;
  double lat;
  double long;
  String date;

  Event(name, title, eventSummary, lat, long, date) {
    this.name = name;
    this.title = title;
    this.eventSummary = eventSummary;
    this.lat = lat;
    this.long = long;
    this.date = date;
  }

  Future<Event> getEvents() async {
    Firestore.instance.collection('events').snapshots().listen((data) =>
        data.documents.forEach((doc) => this.name = (doc["event_creator_id"])));
  }
}
