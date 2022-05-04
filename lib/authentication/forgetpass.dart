import 'package:flutter/material.dart';
import 'package:onlineid/authentication/signin.dart';

class forgetpass extends StatelessWidget {
  const forgetpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Tenda'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Ok'),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                //45064C
                // backgroundColor: Color(0xFFF45064C),
                title: Text('Forgot Password'),
                content:
                    Text('Check Mail on registerd Email and Change password'),
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
          },
        ),
      ),
    );
  }
}
