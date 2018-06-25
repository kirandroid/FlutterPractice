import 'package:flutter/material.dart';

class materialComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Material AppBar",
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.black87,
        ),
        body: new 
        Row(
          children: <Widget>[
            new Container(
              color: Colors.red,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.attach_money,
                      size: 50.0, color: Color(0xffffffff)),
                  Icon(Icons.monetization_on,
                      size: 100.0, color: Color(0xffffffff)),
                  Icon(Icons.attach_money, size: 50.0, color: Color(0xffffffff))
                ],
              ),
            ),
            new Container(
              color: Colors.green,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.phone_iphone,
                      size: 50.0, color: Color(0xffffffff)),
                  Icon(Icons.android, size: 100.0, color: Color(0xffffffff)),
                  Icon(Icons.phone_android,
                      size: 50.0, color: Color(0xffffffff))
                ],
              ),
            ),
            new Container(
              color: Colors.blue,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.mouse, size: 50.0, color: Color(0xffffffff)),
                  Icon(Icons.computer, size: 100.0, color: Color(0xffffffff)),
                  Icon(Icons.keyboard, size: 50.0, color: Color(0xffffffff))
                ],
              ),
            ),
          ],
        ));
  }
}
