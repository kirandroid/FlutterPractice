import 'package:flutter/material.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';

final notificationDuration = new TextEditingController();
final notificationTitle = new TextEditingController();
final notificationContent = new TextEditingController();

class notificationScreen extends StatefulWidget {
  notificationScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<notificationScreen> {
  @override
  initState() {
    super.initState();
  }

  _scheduleNotification() async {
    int notificationId = await ScheduledNotifications.scheduleNotification(
        new DateTime.now()
            .add(new Duration(seconds: int.parse(notificationDuration.text)))
            .millisecondsSinceEpoch,
        "Ticker text",
        notificationTitle.text,
        notificationContent.text);
        notificationDuration.clear();
        notificationContent.clear();
        notificationTitle.clear();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(5.0),
              color: Colors.cyan,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: notificationDuration,
                    decoration: new InputDecoration(
                        hintText: "Enter duration of notification"),
                  ),
                  new TextField(
                    controller: notificationTitle,
                    decoration: new InputDecoration(
                        hintText: "Enter title of notification"),
                  ),
                  new TextField(
                    controller: notificationContent,
                    decoration: new InputDecoration(
                        hintText: "Enter content of notification"),
                  ),
                  new RaisedButton(
                    child: new Text("Time Notification"),
                    onPressed: _scheduleNotification,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
