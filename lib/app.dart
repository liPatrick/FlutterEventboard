import 'package:flutter/material.dart';
import 'package:flutter_eventboard/screens/find_events/homepage.dart';
//import 'package:myapp/ui/theme.dart';


class EventboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      //theme: buildTheme(),
      initialRoute: '/login',
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with 
        // implementation of HomeScreen.
        '/': (context) => MyHomePage(),
        '/find_events': (context) => MyHomePage(),
      },
    );
  }
}