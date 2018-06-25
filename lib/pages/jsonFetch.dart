import 'dart:async';
import 'dart:convert';
import './post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

final myController = new TextEditingController();

Future<List<Post>> fetchPost() async {
  final response =
      await http.get('http://gautamsuman.me/wp-json/wp/v2/posts?_embed');
  final responseJson = json.decode(response.body);
  final List<Post> posts = new List<Post>();
  for (var postData in responseJson) {
    posts.add(Post.fromJson(postData));
  }
  return posts;
}

class Post {
  final int postId;
  final String date;
  final String title;
  final String body;
  final String excerpt;
  final String featuredImage;

  Post(
      {this.postId,
      this.date,
      this.title,
      this.body,
      this.excerpt,
      this.featuredImage});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
        postId: json['id'],
        date: json['date'],
        title: json['title']['rendered'],
        body: json['content']['rendered'],
        excerpt: json['excerpt']['rendered'],
        featuredImage: json['_embedded']['wp:featuredmedia'] != null ?  json['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']['medium']['source_url']:'https://images.pexels.com/photos/559768/pexels-photo-559768.jpeg?dl&fit=crop&crop=entropy&w=640&h=361'
        );
  }
}

class blogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Json Fetch"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        content: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new TextField(
                                controller: myController,
                                autofocus: true,
                                decoration: new InputDecoration(
                                    hintText: "Enter a wordpress address"),
                              ),
                            )
                          ],
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          new FlatButton(
                            child: const Text("Add"),
                            onPressed: () {
                              Future<Post> fetchPost() async {
                                final response = await http.get(
                                    myController.text + '/wp-json/wp/v2/posts');
                                final responseJson = json.decode(response.body);

                                return new Post.fromJson(responseJson[0]);
                              }

                              Navigator.pop(context);
                            },
                          )
                        ],
                      ));
                }),
          ],
        ),
        body: new FutureBuilder<List<Post>>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                print(data);
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                        title: new Card(
                            child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                          //  new Image.network('https://images.pexels.com/photos/559768/pexels-photo-559768.jpeg?dl&fit=crop&crop=entropy&w=640&h=361'),

                          new Image.network(data[index].featuredImage),

                          new ListTile(
                            title: new Text(
                              data[index].title,
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: new HtmlView(data: data[index].excerpt),
                            onTap: () {
                              // print(data[index].featuredImage);
                              Navigator.push(context,
                              new MaterialPageRoute(
                                builder: (context) => postView()
                              )
                              );
                            },
                          )
                        ])));
                  },
                );
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              return new LinearProgressIndicator(
                backgroundColor: Colors.purple,
              );
            }));
  }
}
