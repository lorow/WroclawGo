import 'package:flutter/material.dart';
import 'screens/MainScreen/index.dart';
import 'screens/WelcomeScreen/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (context) => new WelcomeScreen(),
    '/main' : (context) => new MainScreen()
  };

  Routes(){
    runApp(
      new MaterialApp(
        title: 'test',
        routes: routes,
       // home: new MainScreen(),
      )
    );
  }
}