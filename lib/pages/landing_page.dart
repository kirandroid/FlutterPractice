import 'package:flutter/material.dart';
import 'dart:math';

var rng = new Random();
int r = 255, g= 255, b = 255, rS = 100, gS= 100, bS = 100;
class landingPage extends StatefulWidget{
  @override
  landingPageState createState() => new landingPageState();
}

class landingPageState extends State<landingPage>{
  
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Color.fromARGB(255, rS, gS, bS),
      child: new InkWell(
        splashColor: Color.fromARGB(255, r, g, b),
        child: 
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("$k", style: new TextStyle(color: Colors.white, fontSize: 120.0), textAlign: TextAlign.center,),
          ],
        ),
        onTap: () => increaseNum(),
        // onDoubleTap: () => print("DoubleTap"),
        // onLongPress: () => increaseNumLong(),
        
      ),
    );
  }

  int k = 0;
  void increaseNum(){
    setState(() => k++);
    r = rng.nextInt(255);
    g = rng.nextInt(255);
    b = rng.nextInt(255);
    rS = rng.nextInt(255);
    gS = rng.nextInt(255);
    bS = rng.nextInt(255);
}

void increaseNumLong(){
    setState(() => k+=5);
}
}



