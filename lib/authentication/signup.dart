import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineid/authentication/register.dart';
import 'package:onlineid/authentication/signin.dart';
import 'package:onlineid/homescreen/basehome.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isLoading = false;
  bool isComplete = false;
  final formkey = GlobalKey<FormState>();
  // TextEditingController userNameText = new TextEditingController();
  // TextEditingController userEmailText = new TextEditingController();
  // TextEditingController userPasswardText = new TextEditingController();

  final auth = FirebaseAuth.instance;

  late String _email, _password, _username;
  // SignUpMe() {
  //   if (formkey.currentState!.validate() || isComplete == true) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     authobject
  //         .signUp(userEmailText.text, userPasswardText.text)
  //         .then((value) => print('$value'));
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => login()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Tenda'),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            validator: (ValueKey) {
                              if (ValueKey!.isEmpty || ValueKey.length < 4) {
                                return "It's not Empty or Less than 4";
                              } else {
                                isComplete = true;
                              }
                            },
                            onChanged: (ValueKey) {
                              setState(() {
                                _username = ValueKey;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                              hintText: 'Enter Password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            validator: (ValueKey) {
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(ValueKey!)) {
                                return "Enter Valid Email";
                              } else {
                                isComplete = true;
                              }
                            },
                            onChanged: (ValueKey) {
                              setState(() {
                                _email = ValueKey;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            validator: (ValueKey) {
                              if (!RegExp(
                                      "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}")
                                  .hasMatch(ValueKey!)) {
                                isComplete = true;
                              } else {
                                return 'Enter Password Corrext';
                              }
                            },
                            onChanged: (ValueKey) {
                              setState(() {
                                _password = ValueKey.trim();
                              });
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () async {
                      signUpMe();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text('Register'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Already User ?'),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        onTap: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signin(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> signUpMe() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

      if (userCredential != null) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('Registration'),
            content: Text('You have Sucessfully Registered'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => registerpage(
                        emailnavigate: _email,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }
      ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('Registration'),
            content: Text('User already Exist'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => signin()));
                },
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
