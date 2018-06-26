import 'package:flutter/material.dart';
import 'package:practice/MaterialPages/horizontalList.dart';
class materialComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: new Text(
            "Material AppBar",
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.black87,
        ),
        body: new GridView.count(
          primary: false,
          padding: EdgeInsets.all(5.0),
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          crossAxisCount: 3,
          children: <Widget>[
            new RaisedButton(
              color: Color(0xffb71c1c),
              child: new Text("Horizontal List", style: new TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.push(context, 
                new MaterialPageRoute(
                  builder: (context) => horizontalListScreen()
                )
                );
              },
            )
          ],
        )
      );
  }
}
