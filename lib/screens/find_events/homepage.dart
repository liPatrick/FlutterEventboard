import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'event_model.dart';
import 'event_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventboard',
      home: MyHomePage(title: 'Eventboard'),
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
  List<Event> initialEvents = []..add(Event(
      "TEDx Saratoga High",
      "Lorem ipsum lorem ipsum ispum lorem.",
      "Conference Hall 12",
      "December 11th, 2019"));

  Widget titleSection = Container(
      padding: EdgeInsets.all(28),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Icon(Icons.add, color: Colors.blue),
              CupertinoButton(
                child: Semantics(
                  child: const Icon(
                    CupertinoIcons.add_circled,
                    color: Colors.white,
                    size: 44.0,
                  ),
                ),
                onPressed: () => {},
              ),
            ],
          ),
          Text("Events Near Me"),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Eventboard"),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          // background color
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.5
                ],
                colors: [
                  Color(0xFF8BA4F9),
                  Color(0xFFBC9CFF),
                ]),
          ),
          child: Column(
            // main container
            children: <Widget>[
              titleSection,
              // card section
              Container(
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
                          return EventCard(Event(
                              "Daniel", "eventSummary", "location", "date"));
                          /*return new Image.network(
                            "http://via.placeholder.com/300x300",
                            fit: BoxFit.fitWidth,
                          );*/
                        },
                        itemCount: 3,
                        viewportFraction: 0.78,
                        scale: 0.9,
                        //pagination: new SwiperPagination(),
                        //control: new SwiperControl(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
