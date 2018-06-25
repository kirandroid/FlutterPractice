import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:practice/pages/jsonFetch.dart';

class postView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("some title"),
        ),
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new FutureBuilder<List<Post>>(
                future: fetchPost(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        return new HtmlView(data: data[index].body);
                      } else if (snapshot.hasError) {
                        return new Text("${snapshot.error}");
                      }
                      return new LinearProgressIndicator(
                        backgroundColor: Colors.purple,
                      );
                    },
                  );
                })
          ],
        ));
  }
}
