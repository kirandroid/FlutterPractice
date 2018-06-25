import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<ipData> fetchdata() async {
  final response = await http.get("https://ipapi.co/json");
  final responseJson = json.decode(response.body);
  return ipData.fromJson(responseJson);
}

class ipData {
  final String ip;
  final String city;
  final String region;
  final String country_name;
  final double latitude;
  final double longitude;
  final String org;

  ipData(
      {this.ip,
      this.city,
      this.country_name,
      this.latitude,
      this.longitude,
      this.org,
      this.region});

  factory ipData.fromJson(Map<String, dynamic> json) {
    return ipData(
        ip: json['ip'],
        city: json['city'],
        region: json['region'],
        country_name: json['country_name'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        org: json['org']);
  }
}

class ipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: FutureBuilder<ipData>(
            future: fetchdata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new CustomScrollView(
                  slivers: <Widget>[
                    new SliverAppBar(
                      backgroundColor: Colors.red,
                      expandedHeight: 136.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: new FlexibleSpaceBar(
                        background: Image.network(
                            "https://maps.googleapis.com/maps/api/staticmap?zoom=16&size=600x300&maptype=roadmap&markers=color:red|label:K|${snapshot.data.latitude},${snapshot.data.longitude}&key=AIzaSyDlEHutHrLK9cvQN27aMAoQWLlSf4iHGQg"),
                        title: new Text("IP API", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    new SliverList(
                        delegate: new SliverChildListDelegate(<Widget>[
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("IP"),
                                title:
                                    new Center(child: Text(snapshot.data.ip)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("City"),
                                title: new Center(
                                    child: new Text(snapshot.data.city)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("Region"),
                                title: new Center(
                                    child: new Text(snapshot.data.region)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("Country"),
                                title: new Center(
                                    child: Text(snapshot.data.country_name)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("Latitude"),
                                title: new Center(
                                    child: Text("${snapshot.data.latitude}")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("Longitude"),
                                title: new Center(
                                    child: Text(
                                  "${snapshot.data.longitude}",
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new ListTile(
                        title: new Card(
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Text("ISP"),
                                title: new Center(
                                    child: new Text(snapshot.data.org)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Card(
                          child: new InkWell(
                          
                        splashColor: Color.fromARGB(255, 45, 52, 150),
                        onTap: (){},
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image.network(
                                  "https://maps.googleapis.com/maps/api/staticmap?zoom=16&size=600x300&maptype=roadmap&markers=color:red|label:K|${snapshot.data.latitude},${snapshot.data.longitude}&key=AIzaSyDlEHutHrLK9cvQN27aMAoQWLlSf4iHGQg"),
        
                          ],
                        ),
                      )),
                    ]))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

//   if (snapshot.hasData) {
//     return new Container(
//         child: Column(
//           children: <Widget>[
//             // Text("Your IP is ${snapshot.data.ip}", style: new TextStyle(fontSize: 20.0),),
//             // Text("City: ${snapshot.data.city}", style: new TextStyle(fontSize: 20.0),),
//             // Text("Region: ${snapshot.data.region}", style: new TextStyle(fontSize: 20.0),),
//             // Text("Country: ${snapshot.data.country_name}", style: new TextStyle(fontSize: 20.0),),
//             // Text("Latitude: ${snapshot.data.latitude}", style: new TextStyle(fontSize: 20.0),),
//             // Text("Longitude: ${snapshot.data.longitude}", style: new TextStyle(fontSize: 20.0),),
//             // Text("ISP: ${snapshot.data.org}", style: new TextStyle(fontSize: 20.0),),
// Image.network("https://maps.googleapis.com/maps/api/staticmap?zoom=16&size=600x300&maptype=roadmap&markers=color:blue|label:K|${snapshot.data.latitude},${snapshot.data.longitude}&key=AIzaSyDlEHutHrLK9cvQN27aMAoQWLlSf4iHGQg")
//           ],
//         ),
//     );
//   } else if (snapshot.hasError) {
//     return Text("${snapshot.error}");
//   }
//   return Center(child:CircularProgressIndicator());
// })
