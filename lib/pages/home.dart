import 'package:flutter/material.dart';
import './firebaseIntegration.dart';
import './jsonFetch.dart';
import './clicker.dart';
import './mlScan.dart';
import './notify.dart';
import './publicApi.dart';
import './material.dart';
import './ColorVote.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Howm"),
        ),
        drawer: new Drawer(
          child: Column(
            children: <Widget>[
              new DrawerHeader(
                child: new Stack(
                  children: <Widget>[
                    new Positioned(
                      left: 65.0,
                      bottom: 60.0,
                      child: new Text(
                        "Practice App",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://cdn.dribbble.com/users/5055/screenshots/4730432/dribbble-skull.gif'),
                      fit: BoxFit.cover),
                ),
              ),
              new Expanded(
                  child: new ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.cloud_upload),
                    title: new Text("FireStore Example"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new firebaseInt()));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.web),
                    title: new Text("Json Fetch Example"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new blogScreen()));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.fingerprint),
                    title: new Text("Clicker Example"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new clickerScreen()));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.view_quilt),
                    title: new Text("ML Scanner"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Home()));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.star),
                    title: new Text("Material Components"),
                    onTap: () {},
                  ),
                  new ListTile(
                    leading: new Icon(Icons.lock),
                    title: new Text("Authentication"),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.notifications),
                    title: new Text("Notification"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new notificationScreen()));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.public),
                    title: new Text("Public API"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new publicApiScreen()));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.colorize),
                    title: new Text("Color Vote"),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ColorVoteScreen()));
                    },
                  ),
                ],
              )),
            ],
          ),
          // child: new ListView(
          //   padding: EdgeInsets.zero,
          //   children: <Widget>[
          //     new DrawerHeader(
          //       child: new Stack(
          //         children: <Widget>[
          //           new Positioned(
          //             left: 65.0,
          //             bottom: 60.0,
          //             child: new Text(
          //               "Practice App",
          //               style: new TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 25.0,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           )
          //         ],
          //       ),
          //       decoration: new BoxDecoration(
          //         image: new DecorationImage(
          //             image: new NetworkImage(
          //                 'https://cdn.dribbble.com/users/5055/screenshots/4730432/dribbble-skull.gif'),
          //             fit: BoxFit.cover),
          //       ),
          //     ),
          // new ListTile(
          //   leading: new Icon(Icons.cloud_upload),
          //   title: new Text("FireStore Example"),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         new MaterialPageRoute(
          //             builder: (context) => new firebaseInt()));
          //   },
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.web),
          //   title: new Text("Json Fetch Example"),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         new MaterialPageRoute(
          //             builder: (context) => new blogScreen()));
          //   },
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.fingerprint),
          //   title: new Text("Clicker Example"),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         new MaterialPageRoute(
          //             builder: (context) => new clickerScreen()));
          //   },
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.view_quilt),
          //   title: new Text("ML Scanner"),
          //   onTap: () {
          //     Navigator.push(context,
          //         new MaterialPageRoute(builder: (context) => new Home()));
          //   },
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.star),
          //   title: new Text("Material Components"),
          //   onTap: () {},
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.lock),
          //   title: new Text("Authentication"),
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.notifications),
          //   title: new Text("Notification"),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         new MaterialPageRoute(
          //             builder: (context) => new notificationScreen()));
          //   },
          // ),
          // new ListTile(
          //   leading: new Icon(Icons.public),
          //   title: new Text("Public API"),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         new MaterialPageRoute(
          //             builder: (context) => new publicApiScreen()));
          //   },
          // )
          //   ],
          // ),
        ),
        body: new GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5.0),
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          crossAxisCount: 2,
          children: <Widget>[
            new RaisedButton(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.cloud_upload,
                    color: Colors.white,
                  ),
                  new Text("FireStore Data",
                      style: new TextStyle(color: Colors.white)),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new firebaseInt()));
              },
            ),
            new RaisedButton(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.web,
                    color: Colors.white,
                  ),
                  new Text(
                    "Json Fetch",
                    style: new TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new blogScreen()));
              },
            ),
            new RaisedButton(
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.fingerprint,
                    color: Colors.white,
                  ),
                  new Text(
                    "Clicker",
                    style: new TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new clickerScreen()));
              },
            ),
            new RaisedButton(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.view_quilt,
                    color: Colors.white,
                  ),
                  new Text(
                    "ML Kit",
                    style: new TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Home()));
              },
            ),
            new RaisedButton(
              color: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  new Text(
                    "Material Design",
                    style: new TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => materialComponent()));
              },
            ),
            new RaisedButton(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  new Text(
                    "Authentication",
                    style: new TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {},
            ),
            new RaisedButton(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  new Text(
                    "Notification",
                    style: new TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new notificationScreen()));
              },
            ),
            new RaisedButton(
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.public,
                    color: Colors.white,
                  ),
                  new Text(
                    "Public API",
                    style: new TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new publicApiScreen()));
              },
            ),
            new RaisedButton(
              color: Colors.cyan,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.colorize,
                    color: Colors.white,
                  ),
                  new Text(
                    "Color Vote",
                    style: new TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ColorVoteScreen()));
              },
            )
          ],
        ));
  }
}
