import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorVoteScreen extends StatelessWidget {
  final myColorNameController = new TextEditingController();
  final myColorHexController = new TextEditingController();

hexToInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new ListTile(
      key: new ValueKey(document.documentID),
      title: new Card(
        child: new InkWell(
          onTap: () => Firestore.instance.runTransaction((transaction) async {
              DocumentSnapshot freshSnap =
                  await transaction.get(document.reference);
              await transaction.update(
                  freshSnap.reference, {'Votes': freshSnap['Votes'] + 1});
            }),
          child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              width: 250.0,
              height: 100.0,
              color: Color(0xff+hexToInt(document['ColorHex'])),
            ),
            new ListTile(
              title: new Text(document['ColorName']),
              trailing: new Text(document['Votes'].toString()),
            )
            
          ],
          
        ),
        )
      )
      
      // new Text(
      //   document['ColorName'], style: new TextStyle(fontSize: 18.0)
      // ),
      // trailing: 
      // new Text(document['votes'].toString(), style: new TextStyle(fontSize: 18.0),),
      // onTap: () => Firestore.instance.runTransaction((transaction) async {
      //         DocumentSnapshot freshSnap =
      //             await transaction.get(document.reference);
      //         await transaction.update(
      //             freshSnap.reference, {'votes': freshSnap['votes'] + 1});
      //       }),
      //   onLongPress: () => showDialog(
      //       context: context,
      //       child: new AlertDialog(
      //         content: new Row(
      //           children: <Widget>[
      //             new Expanded(
      //               child: new TextField(
      //                 controller: editmyController,
      //                 autofocus: true,
      //                 decoration:
      //                     new InputDecoration(hintText: "Edit the Name"),
      //               ),
      //             )
      //           ],
      //         ),
      //         actions: <Widget>[
      //           new FlatButton(
      //               child: new Text(
      //                 "Delete",
      //                 style: new TextStyle(color: Colors.red),
      //               ),
      //               onPressed: () {
      //                 Firestore.instance.runTransaction((transaction) async {
      //                   DocumentSnapshot freshSnap =
      //                       await transaction.get(document.reference);
      //                   await transaction.delete(freshSnap.reference);
      //                 });
      //                 Navigator.pop(context);
      //               }),
      //           new FlatButton(
      //             child: const Text("Cancel"),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //           new FlatButton(
      //             child: const Text("Edit"),
      //             onPressed: () {
      //                   Firestore.instance.runTransaction((transaction) async {
      //                   DocumentSnapshot freshSnap =
      //                   await transaction.get(document.reference);
      //                   await transaction.update(freshSnap.reference, {'name': editmyController.text});
      //                 });
      //                 Navigator.pop(context);
      //             }
      //           )
      //         ],
      //       ))
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
                              controller: myColorNameController,
                              autofocus: true,
                              decoration: new InputDecoration(
                                  hintText: "Enter Color name"),
                            ),
                          ),
                          new Expanded(
                          child: new TextField(
                              controller: myColorHexController,
                              decoration: new InputDecoration(
                                hintText: "Enter Color"
                              ),
                            )
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
                                .collection('ColorVote')
                                .document(myColorNameController.text)
                                .setData(
                                    {'ColorHex': myColorHexController.text,'ColorName': myColorNameController.text,'Votes': 0});
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ));
              }),
        ],
      ),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('ColorVote').snapshots(),
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
