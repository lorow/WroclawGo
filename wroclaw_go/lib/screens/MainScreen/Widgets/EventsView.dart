import 'package:flutter/material.dart';

class EventsViewState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EventsView();
  }

}

class EventsView extends State<EventsViewState>{

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) /2.6;
    final double itemWidth = size.width / 2;
  
    final Set<Widget> _saved = new Set<Widget>();
    final items  = <Widget>[];

    return Container(
      color: Colors.white10,
      child: _buildGrid()
      );
  }

  Widget _buildGrid(){
    return new GridView.builder(
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8
        ),
        itemBuilder: (BuildContext context, int index) {

          return new GestureDetector(
            child: new Container(
              color: Colors.red,
              margin: EdgeInsets.all(5.0),
            ),
          );
        });
  }
}