import 'package:flutter/material.dart';

class horizontalListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: new Text(
            "Horizontal List",
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.black87,
        ),
        body:
        new Container(
          margin: EdgeInsets.symmetric(vertical: 100.0),
          height: 100.0,
          child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Container(
              width: 110.0,
              // color: Colors.red,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=0'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.black,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1083'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.blue,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1080'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.green,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1074'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.grey,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1069'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.yellow,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1070'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.deepOrange,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1062'),
                      fit: BoxFit.cover),
                ),
            ),
            new Container(
              width: 110.0,
              // color: Colors.pink,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://picsum.photos/200/300?image=1042'),
                      fit: BoxFit.cover),
                ),
            ),
          ],
          
        )
        )
        
      );
  }
}
