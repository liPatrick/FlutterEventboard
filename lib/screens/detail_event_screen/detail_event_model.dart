import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// event card model class
class Event {
  String date_created;
  String post_creator_id;
  String post_text;
  String post_title;

  Event(date_created, post_creator_id, post_text, post_title) {
    this.date_created = date_created;
    this.post_creator_id = post_creator_id;
    this.post_text = post_text;
    this.post_title = post_title;
  }

  
}
