
import 'package:flutter/material.dart';

class Text2QRScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text2QR"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Image.network('https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=Kiran'),
          ],
        )
      ),
    );
  }

}