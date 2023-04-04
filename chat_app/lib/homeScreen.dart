// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chat_app/global.dart';
import 'package:chat_app/oVoconnectionModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var uuid = Uuid();
  String otheruser = '';
  String you = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(MyData().you),
      ),
      body: Center(
          child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const LinearProgressIndicator();
                } else {
                  return Expanded(
                      child:
                          listBuilder(snapshot.data as QuerySnapshot<Object?>));
                }
              }),
        ],
      )),
    );
  }

  Widget listBuilder(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        return ListTile(
          title: Text(doc['displayName']),
          subtitle: Text(doc['email']),
          onTap: () {
            otheruser = doc['email'];
            you = MyData().you;
            // Navigator.of(context).pushNamed('/chat/'+otheruser+'/'+you);

            MyData().otheruser = otheruser;
            MyData().you = you;
            MyData().uniqueConnectionid =
                createUniqueConnectionID(otheruser, you);

            context.go('/chat');

            // context
            //     .goNamed('chat', params: {'otheruser': otheruser, 'you': you});

            //makeConnection(doc['email'], widget.email);
          },
        );
      },
    );
  }
}

String createUniqueConnectionID(String str1, String str2) {
  // Concatenate the two strings
  String combined = str1 + str2;

  // Sort the combined string alphabetically
  List<String> chars = combined.split('');
  chars.sort();
  String sorted = chars.join('');

  // Hash the sorted string using SHA-256
  var bytes = utf8.encode(sorted);
  var hash = sha256.convert(bytes);

  // Return the hash as a hexadecimal string
  return hash.toString();
}

// Future makeConnection(otherUser, String you) async {
//   final googleuser = FirebaseFirestore.instance
//       .collection('1to1')
//       .doc(createUniqueConnectionID(otherUser, you))
//       .collection('messages')
//       .doc();

//   final newgoogleuser = oVoconnectionModel(
//       messageBody: '', sentby: you, dateTime: DateTime.now().toString());

//   await googleuser.set(newgoogleuser.toMap());
// }

// String createUniqueConnectionID(String str1, String str2) {
//   String combinedString = str1 + str2;
//   var bytes = utf8.encode(combinedString); // convert string to bytes
//   var hash = md5.convert(bytes); // generate MD5 hash
//   return hash.toString(); // return hash as a string
// }
