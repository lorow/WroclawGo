import 'package:flutter/material.dart';
import "./Widgets/index.dart";


class MainScreenState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreen();
  }
}

class MainScreen extends State<MainScreenState> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    new EventsViewState(),
    new SavedEventsViewState()
  ];
  final List<Text> titles = [new Text("Wydarzenia"), new Text("Zapisane")];

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 20.0,

        title: titles[_currentIndex],

        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.blue,
            fontSize: 20.0
          )
        ),
        centerTitle: true,
      ),

      body: _children[_currentIndex],

      bottomNavigationBar: new BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: new Icon( Icons.home), 
                title: new Text('Home')
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.favorite),
              title: new Text("Saved")
            ),
          ]
        ),
    );
  }
}