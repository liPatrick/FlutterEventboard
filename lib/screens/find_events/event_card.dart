import 'package:flutter/material.dart';
import 'event_model.dart';

class EventCard extends StatefulWidget {
  Event event;

  EventCard(this.event);

  @override
  _EventCardState createState() => _EventCardState(event);
}

class _EventCardState extends State<EventCard> {
  Event event;

  _EventCardState(this.event);

  Widget get eventCard {
    return Container(
        width: 300,
        height: 375,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("testing"),
                Text("dan"),
                Row(
                  children: <Widget>[Icon(Icons.star), Text("5/5")],
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          eventCard
        ],
      ),
    );
  }
}
