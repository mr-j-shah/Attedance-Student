import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlineid/homescreen/basehome.dart';
import 'package:onlineid/user/user.dart';

class edit extends StatefulWidget {
  edit({
    Key? key,
  }) : super(key: key);
  // final user userdata;
  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  final formkey = GlobalKey<FormState>();
  user uservalue = new user();
  bool isloading = true;
  String? email = FirebaseAuth.instance.currentUser!.email;
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: TextFormField(
                //     onChanged: (ValueKey) {
                //       setState(() {
                //         uservalue.name = ValueKey;
                //       });
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Name',
                //       hintText: 'Enter Full Name',
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: TextFormField(
                //     onChanged: (ValueKey) {
                //       setState(() {
                //         uservalue.dob = ValueKey;
                //       });
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Date of Birth',
                //       hintText: 'Enter DOB in dd/mm/yyyy formate',
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: TextFormField(
                //     onChanged: (ValueKey) {
                //       setState(() {
                //         uservalue.blood = ValueKey;
                //       });
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Blood Group',
                //       hintText: 'Enter Blood Group',
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: TextFormField(
                //     onChanged: (ValueKey) {
                //       setState(() {
                //         uservalue.number = ValueKey;
                //       });
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Enrollment Number',
                //       hintText: 'Enter Number',
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.phone = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile Number',
                      hintText: 'Enter Mobile Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.location = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                      hintText: 'Enter Address',
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: TextFormField(
                //     onChanged: (ValueKey) {
                //       setState(() {
                //         uservalue.department = ValueKey;
                //       });
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Department',
                //       hintText: 'Enter Department',
                //     ),
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        UpdateMe(
                          // enrollment: uservalue.number,
                          // name: uservalue.name,
                          email: email,
                          // Department: uservalue.department,
                          Phone: uservalue.phone,
                          // Dob: uservalue.dob,
                          location: uservalue.location,
                          // blood: uservalue.blood,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BaseHome()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> UpdateMe({
    String? email,
    String? Phone,
    String? location,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update(
      {
        // 'Enrollment': enrollment,
        // 'Name': name,
        // 'email': email,
        // 'Department': Department,
        'Phone': Phone,
        // 'Dob': Dob,
        'location': location,
        // 'blood': blood,
        // "isRegistered": true,
      },
    );
    isloading = false;
  }
}
