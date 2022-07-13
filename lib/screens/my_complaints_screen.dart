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
      theme: ThemeData(useMaterial3: true),
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
            return Scaffold(
              backgroundColor: secondaryBackgroundColor,
              body: ListView.builder(
                itemBuilder: (context, position) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                        child: Column(children: [
                          Card(
                            color: Color.fromARGB(255, 243, 84, 72),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 75,
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${(snapshot.data! as dynamic).docs[position]['title']}',
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '${(snapshot.data! as dynamic).docs[position]['complain']}',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  );
                },
                itemCount: (snapshot.data! as dynamic).docs.length,
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
