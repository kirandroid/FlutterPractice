import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final nameController = new TextEditingController();

Future<GenderData> fetchdata() async {
  print("Text is ${nameController.text}");
  final response = await http.get("https://api.genderize.io/?name=${nameController.text}");
  final responseJson = json.decode(response.body);
  return GenderData.fromJson(responseJson);
}

class GenderData {
  final String gender;
  final double probability;
  final int count;

  GenderData({this.gender, this.probability, this.count});

  factory GenderData.fromJson(Map<String, dynamic> json) {
    return GenderData(
        gender: json['gender'],
        probability: json['probability'],
        count: json['count']);
  }
}

class genderizeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Genderize'),
      ),
      body: new Center(
        child: new Container(
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: nameController,
                decoration:
                    new InputDecoration(hintText: "Enter your first name"),
              ),
              new RaisedButton(
                  child: new Text("Submit"),
                  onPressed: () {
                    return FutureBuilder<GenderData>(
                        future: fetchdata(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print('Data ${snapshot.data}');
                            return new Text(snapshot.data.gender);
                            // return new AlertDialog(
                            //   content: new Column(
                            //     children: <Widget>[
                            //       new Text(snapshot.data.gender),
                            //       new Text(
                            //           (snapshot.data.probability).toString()),
                            //       new Text((snapshot.data.count).toString())
                            //     ],
                            //   ),
                            // );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
