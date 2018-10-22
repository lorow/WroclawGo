import 'dart:ui';

import 'package:flutter/material.dart';
import 'httpHelpers/index.dart';
import "Models/index.dart";

class EventsViewState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EventsView();
  }

}

class EventsView extends State<EventsViewState>{

  @override
  Widget build(BuildContext context) {

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
          index++;
          return _buildRow(new eventModel(index));
        });
  }

  Widget _buildRow (eventModel model){
    return tile(model:model);
  }
}

class tile extends StatefulWidget{

  final eventModel model;

  tile({Key key, @required this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return tileState();
  }
}

class tileState extends State<tile>{
  @override

  httpHelper helper = new httpHelper();

  Widget backgroundImage = new Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: new AssetImage('assets/concert.jpg'),
        fit: BoxFit.fitHeight,
      ),
    ),
  );

  BackdropFilter blur =  new BackdropFilter(
    filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.black.withOpacity(0.6),
      ),
    ),
  );


  Widget build(BuildContext context) {
    return new GestureDetector(

      child: new InkResponse(
        enableFeedback: true,
        onTap: (){
          setState(() {
          });
        },
        child: new Container(
            margin: EdgeInsets.all(5.0),
            child: new Stack(
              children: <Widget>[
                backgroundImage,
                blur,
                FutureBuilder<Post>(
                  future: helper.fetchEvent(widget.model.id),
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      return Center(
                          child:Text(snapshot.data.shortTitle)
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}