import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineid/authentication/forgetpass.dart';
import 'package:onlineid/authentication/signup.dart';
import 'package:onlineid/homescreen/basehome.dart';

class signin extends StatefulWidget {
  signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  String? _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Register'),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.only(top: 100),
            children: [
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (ValueKey) {
                          return !RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(ValueKey!)
                              ? "Enter Valid Email"
                              : null;
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
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (ValueKey) {
                          return ValueKey!.isEmpty || ValueKey.length < 6
                              ? "It's not Empty or Less than 4"
                              : null;
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
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?'),
                  ),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => forgetpass(),
                      ),
                    );
                  },
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
                  child: FlatButton(
                      child: Text('Sign In'),
                      onPressed: () async {
                        signinMe();
                      }),
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
                        child: Text('Don\'t have account?'),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      onTap: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signup(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> signinMe() async {
    try {
      if (_email != null && _password != null) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.toString(), password: _password.toString());
        if (userCredential != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BaseHome(),
            ),
          );
        }
      } else {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('Null Entry'),
            content: Text('Please enter value properly'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('You have not registered yet'),
            content: Text('Please register first'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('Error'),
            content: Text('Enter Password Again!'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Forgot Password'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => forgetpass()));
                },
              ),
            ],
          ),
        );
      }
    }
  }
}
