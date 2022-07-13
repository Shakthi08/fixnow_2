// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fixnoww/resources/auth_methods.dart';
import 'package:fixnoww/screens/my_complaints_screen.dart';
import 'package:fixnoww/screens/to_you_complaints_screen.dart';
import 'package:fixnoww/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _authMethods = AuthMethods();

  signOut() {
    _authMethods.signOut();
    Navigator.of(context).pop();
  }

  closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My complaints"),
            CustomDialog(
                btn1text: "No",
                btn2text: "Yes",
                content: "Are you sure you want to sign out?",
                onPressedbtn1: closeDialog,
                onPressedbtn2: signOut,
                title: "Sign out"),
          ],
        ),
      ),
      body: MyComplaintsScreen(),
    );
  }
}
