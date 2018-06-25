import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firebaseInt extends StatelessWidget {
  final myController = new TextEditingController();
  final editmyController = new TextEditingController();


  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new ListTile(
      key: new ValueKey(document.documentID),
      title: new Text(
        document['name'], style: new TextStyle(fontSize: 18.0)
      ),
      trailing: new Text(document['votes'].toString(), style: new TextStyle(fontSize: 18.0),),
      onTap: () => Firestore.instance.runTransaction((transaction) async {
              DocumentSnapshot freshSnap =
                  await transaction.get(document.reference);
              await transaction.update(
                  freshSnap.reference, {'votes': freshSnap['votes'] + 1});
            }),
        onLongPress: () => showDialog(
            context: context,
            child: new AlertDialog(
              content: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      controller: editmyController,
                      autofocus: true,
                      decoration:
                          new InputDecoration(hintText: "Edit the Name"),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text(
                      "Delete",
                      style: new TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Firestore.instance.runTransaction((transaction) async {
                        DocumentSnapshot freshSnap =
                            await transaction.get(document.reference);
                        await transaction.delete(freshSnap.reference);
                      });
                      Navigator.pop(context);
                    }),
                new FlatButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                new FlatButton(
                  child: const Text("Edit"),
                  onPressed: () {
                        Firestore.instance.runTransaction((transaction) async {
                        DocumentSnapshot freshSnap =
                        await transaction.get(document.reference);
                        await transaction.update(freshSnap.reference, {'name': editmyController.text});
                      });
                      Navigator.pop(context);
                  }
                )
              ],
            ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Vote Now!"),
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
                                  hintText: "Enter a name to add"),
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
                            Firestore.instance
                                .collection('Game')
                                .document(myController.text)
                                .setData(
                                    {'name': myController.text, 'votes': 0});
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ));
              }),
        ],
      ),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('Game').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return new LinearProgressIndicator(
                backgroundColor: Colors.green,
              );
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: EdgeInsets.all(16.0),
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}
