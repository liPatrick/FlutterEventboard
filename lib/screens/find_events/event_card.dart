import 'package:flutter/material.dart';
import 'event_model.dart';
import 'package:flutter/cupertino.dart';

class EventCard extends StatefulWidget {
  Event event;

  EventCard(Event event) {
    this.event = event;
  }

  @override
  _EventCardState createState() => _EventCardState(this.event);
}

class _EventCardState extends State<EventCard> {
  Event event;

  _EventCardState(Event event) {
    this.event = event;
  }

  Widget get eventCard {
    return Container(
        width: 300,
        height: 375,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 8.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    event.name,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    event.title,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                ),
                Divider(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 10.0),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBC9CFF),
                        fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    event.eventSummary,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13.0),
                  ),
                ),
                Divider(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 7.0),
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBC9CFF),
                                  fontSize: 13.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, right: 10.0),
                            child: Text(
                             event.date,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 7.0),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBC9CFF),
                                  fontSize: 13.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, right: 10.0),
                            child: Text(
                              "location placeholder text",
                              //event.location,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    height: 10.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      color: Color(0xFFEFE7FF),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15, right: 20.0, left: 20),
                        child: Text(
                          "Enter the event page",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFBC9CFF),
                              fontSize: 13.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () => {},
                    ),)
                  ],
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
        children: <Widget>[eventCard],
      ),
    );
  }
}
