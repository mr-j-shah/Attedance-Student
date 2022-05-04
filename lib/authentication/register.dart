import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlineid/homescreen/basehome.dart';
import 'package:onlineid/profile/profilepage.dart';
import 'package:onlineid/user/user.dart';

class registerpage extends StatefulWidget {
  registerpage({Key? key, required this.emailnavigate}) : super(key: key);
  final String emailnavigate;
  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final formkey = GlobalKey<FormState>();
  user uservalue = new user();
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Card Me'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.name = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter Full Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.dob = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth',
                      hintText: 'Enter DOB in dd/mm/yyyy formate',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.blood = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Blood Group',
                      hintText: 'Enter Blood Group',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.number = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enrollment Number',
                      hintText: 'Enter Number',
                    ),
                  ),
                ),
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (ValueKey) {
                      setState(() {
                        uservalue.department = ValueKey;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
                      hintText: 'Enter Department',
                    ),
                  ),
                ),
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
                    child: InkWell(
                      child: Text('Save'),
                      onTap: () async {
                        regiserMe(
                          enrollment: uservalue.number,
                          name: uservalue.name,
                          email: widget.emailnavigate,
                          Department: uservalue.department,
                          Phone: uservalue.phone,
                          Dob: uservalue.dob,
                          location: uservalue.location,
                          blood: uservalue.blood,
                        );
                        isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black38,
                                ),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BaseHome(),
                                ),
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

  Future<void> regiserMe({
    String? enrollment,
    String? name,
    String? email,
    String? Department,
    String? Phone,
    String? Dob,
    String? location,
    String? blood,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(email).set(
      {
        'Enrollment': enrollment,
        'Name': name,
        'email': email,
        'Department': Department,
        'Phone': Phone,
        'Dob': Dob,
        'location': location,
        'blood': blood,
        "isRegistered": true,
      },
    );
    isloading = false;
  }
}
