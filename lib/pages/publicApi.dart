import 'package:flutter/material.dart';
import 'package:practice/API/kitsu.dart';
import 'package:practice/API/genderize.dart';
import 'package:practice/API/ipify.dart';
import 'package:practice/API/text2QR.dart';

class publicApiScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Public Apis"),
      ),
      body: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5.0),
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 3,
        children: <Widget>[
          new RaisedButton(
            color: const Color(0xfff44336),
            child: new Text("Kitsu API", style: new TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.push(context, 
              new MaterialPageRoute(
                builder: (context) => kitsuScreen()
              )
              );
            },
          ),
          new RaisedButton(
            color: const Color(0xff039BE5),
            child: new Text("Genderize API", style: new TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.push(context, 
              new MaterialPageRoute(
                builder: (context) => genderizeScreen()
              )
              );
            },
          ),
          new RaisedButton(
            color: const Color(0xffFFB300),
            child: new Text("IPAPI", style: new TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.push(context, 
              new MaterialPageRoute(
                builder: (context) => ipScreen()
              )
              );
            },
          ),
          new RaisedButton(
            color: const Color(0xff546E7A),
            child: new Text("Text2QR API", style: new TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.push(context, 
              new MaterialPageRoute(
                builder: (context) => Text2QRScreen()
              )
              );
            },
          ),
        ],
      ),
    );
  }
}