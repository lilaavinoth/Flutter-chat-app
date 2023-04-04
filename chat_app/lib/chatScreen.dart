// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:chat_app/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'oVoconnectionModel.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  var messagetxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    queryBuilder();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('1 v 1 chat screen'),
      ),
      body: Column(children: [
        const Gap(10),
        TextField(
          controller: messagetxt,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Send message',
          ),
        ),
        ElevatedButton(
            onPressed: () {
              sendMessage(messagetxt.text);
            },
            child: const Text('send message')),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('1to1')
                .doc(MyData().uniqueConnectionid)
                .collection('messages')
                .orderBy('dateTime', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              } else {
                return Expanded(
                    child:
                        listBuilder(snapshot.data as QuerySnapshot<Object?>));
              }
            })
      ]),
    );
  }

  Future sendMessage(String text) async {
    Timestamp timestamp = Timestamp.now();
    final googleuser = FirebaseFirestore.instance
        .collection('1to1')
        .doc(MyData().uniqueConnectionid)
        .collection('messages')
        .doc();

    final newgoogleuser = oVoconnectionModel(
        messageBody: text,
        sentby: MyData().you,
        sentto: MyData().otheruser,
        dateTime: timestamp);

    await googleuser.set(newgoogleuser.toMap());
  }

  Widget listBuilder(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        if (doc['sentby'] == MyData().you) {
          return Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Card(
                  color: Color.fromARGB(255, 26, 129, 29),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doc['messageBody'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                showdateTime(doc['dateTime'])
              ],
            ),
          );
          // return ListTile(
          //   tileColor: Colors.blue,
          //   title: Text(doc['messageBody']),
          //   subtitle: Text(doc['dateTime']),
          // );
        } else {
          return Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Card(
                  color: Color.fromARGB(255, 84, 85, 84),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doc['messageBody'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                showdateTime(doc['dateTime'])
              ],
            ),
          );
          // return ListTile(
          //   tileColor: Colors.amber,
          //   title: Text(doc['messageBody']),
          //   subtitle: Text(doc['dateTime']),
          // );
        }
      },
    );
  }
}

showdateTime(timestamp) {
  DateTime dateTime = timestamp.toDate();
  String dateString = DateFormat.yMMMEd().add_Hm().format(dateTime);
  return Text(dateString);
}

queryBuilder() {
  final query = FirebaseFirestore.instance
      .collection('1to1')
      .doc(MyData().uniqueConnectionid)
      .collection('messages')
      .where('sentby', isEqualTo: MyData().you)
      .get()
      .then((value) {
    print("Successfully completed");
    for (var docSnapshot in value.docs) {
      print('${docSnapshot.id} => ${docSnapshot.data()}');
    }
  });
}
