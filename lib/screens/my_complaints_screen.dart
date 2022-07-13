// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fixnoww/resources/firestore_resource.dart';
import 'package:fixnoww/utils/colors.dart';
import 'package:fixnoww/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class MyComplaintsScreen extends StatefulWidget {
  const MyComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<MyComplaintsScreen> createState() => _MyComplaintsScreenState();
}

class _MyComplaintsScreenState extends State<MyComplaintsScreen> {
  fabPress() {
    showSnackBar(context, "HIHI");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: secondaryBackgroundColor,
        body: StreamBuilder(
          stream: FirestoreMethods().myComplaints,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Title: ${(snapshot.data! as dynamic).docs[index]['title']}',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                trailing: Text(
                  '${(snapshot.data! as dynamic).docs[index]['complain']}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // FirestoreMethods().addToMeetingHistory(
            //     context, "New comp", "I am giving this new complain");
            Navigator.pushNamed(context, '/newc');
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
