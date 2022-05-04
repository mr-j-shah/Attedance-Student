import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../homescreen/basehome.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  String? email = FirebaseAuth.instance.currentUser!.email;

  // Future<DocumentSnapshot<Map<String, dynamic>>> documentSnapshot =
  //     FirebaseFirestore.instance.collection('my_contact').doc('details').get();
  String password = "1234", checker = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PIN',
                hintText: 'Enter Pin',
              ),
              onChanged: (text) {
                checker = text;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 140, 145, 190),
                ),
              ),
              onPressed: () {
                press();
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }

  press() async {
    if (checker == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseHome()),
      );
    } else {
      print('no user allowed');
    }
  }
}
