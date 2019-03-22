import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'event_model.dart';
import 'event_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventboard',
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: MyHomePage(title: 'Eventboard'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // hardcode some events
  List<Event> initialEvents = [];

  GlobalKey bottomNavigationKey = GlobalKey();

  Widget titleSection = Container(
      padding: EdgeInsets.only(top: 30, left: 27, right: 30),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Icon(Icons.add, color: Colors.blue),
              CupertinoButton(
                child: Semantics(
                  child: const Icon(
                    CupertinoIcons.add_circled_solid,
                    color: Colors.white,
                    size: 44.0,
                  ),
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ));

  Widget eventsNearMe = Container(
      padding: EdgeInsets.only(top: 12, left: 47, right: 30),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Icon(Icons.add, color: Colors.blue),
              Text(
                "Events near me",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.0),
              )
            ],
          ),
        ],
      ));

  Widget numEventsNearYou = Container(
      padding: EdgeInsets.only(top: 5, left: 47, right: 30),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Icon(Icons.add, color: Colors.blue),
              Text(
                "10 events near you",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 15.5),
              )
            ],
          ),
        ],
      ));

  // main UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // background color
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.4,
                0.7
              ],
              colors: [
                Color(0xFFBC9CFF),
                Color(0xFF8BA4F9),
              ]),
        ),
        child: Column(
          // main container
          children: <Widget>[
            titleSection,
            eventsNearMe,
            numEventsNearYou,
            _buildList(context),
            // card section
          ],
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.star, title: "Events near me", onclick: () => {}),
          TabData(iconData: Icons.person, title: "Profile", onclick: () => {}),
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        activeIconColor: Color(0xFFBC9CFF),
        circleColor: Color(0xFFEFE7FF),
        inactiveIconColor: Color(0xFFBC9CFF),
        textColor: Color(0xFF7f8c8d),
        onTabChangedListener: (position) {
          setState(() {
            //currentPage = position;
          });
        },
      ),
    );
    //Queries Firebase for events
  }

  Widget _buildList(BuildContext context) {
    //mapping snapshot into initialEvents arraylist
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("events").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          default:
            initialEvents = [];
            snapshot.data.documents.forEach((doc) {
              var event = Event(
                  doc["event_creator_name"],
                  doc["event_title"],
                  doc["event_summary"],
                  doc["lat"],
                  doc["long"],
                  doc["date_created"]);
              initialEvents.add(event);
            });
            print("returning");
            return _createEventCards(context);
        }
      },
    );
  }

  Widget _createEventCards(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        // main column
        //color: Colors.green,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          // children in row 1
          children: <Widget>[
            // container for swiper
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              // create a new event card
              child: new Swiper(
                // set cont. loop to false
                loop: false,
                itemBuilder: (BuildContext context, int index) {
                  //var eventcard =EventCard(event)
                  return EventCard(initialEvents[index]);
                },
                itemCount: initialEvents.length,
                viewportFraction: 0.78,
                scale: 0.9,
                //control: new SwiperControl(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
