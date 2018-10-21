import 'dart:ui';
import "package:flutter/material.dart";

class InitialScreenState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InitialScreen();
  }

}

class InitialScreen extends State<InitialScreenState>{

  static var _context;

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

  Widget startButton =  new Container(
    padding: EdgeInsets.only(bottom: 60.0),

      child:new ButtonTheme(
       minWidth: 150.0,
       height: 35.0,
          child: new OutlineButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
            ),

            textColor: Colors.white,
            color: Colors.blue,

            child: new Text('Start!'),
            onPressed: (){
              Navigator.pushReplacementNamed(_context, '/main');
            }
        )
     )
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
    _context = context;
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            // background Image
            backgroundImage,
            blur,
            middleText,
            Align(
              alignment: Alignment(0.0, 1.0),
              child: startButton
            )
          ],
        )
    );
  }
}