import 'dart:ui';

import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget{

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

  Widget buttonNext = new Container(
    padding: new EdgeInsets.only(bottom: 300.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        new RaisedButton(
            onPressed: (){

            }
        )
      ],
    ),
  );

  static Widget topText =  new Container(
    padding: new EdgeInsets.only(top: 190.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        new Text(
          'Wrocław Go',
          // ignore: conflicting_dart_import
          style: new TextStyle(
              fontSize: 50.0,
              color: Colors.white
          ),
        )
      ],
    ),
  );

  static Widget bottomText =  new Container(
    padding: new EdgeInsets.only(top: 15.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        new Text(
          'Odkryj nowości',
          style: new TextStyle(
              fontSize: 28.0,
              color: Colors.white
          ),
        )
      ],
    ),
  );

  Widget middleText = new Column(
    children: <Widget>[
      topText,
      bottomText
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          // background Image
          backgroundImage,

          blur,

          middleText,

          buttonNext
        ],
      )
    );
  }
}