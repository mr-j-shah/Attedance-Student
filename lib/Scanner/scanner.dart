import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:onlineid/homescreen/basehome.dart';
import 'package:onlineid/user/user.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

Lectur _lec = new Lectur();
user us = new user();
String? barcodeScanRes;
DateTime now = new DateTime.now();

class Scanner extends StatefulWidget {
  Scanner({Key? key, required this.userdata}) : super(key: key);
  final user userdata;
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.all(10),
          //   child: Container(
          //     child: Card(
          //       child: Text(
          //         widget.userdata.number.toString(),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
            child: FlatButton(
              color: Color.fromARGB(255, 213, 241, 124),
              onPressed: () async {
                await FlutterBarcodeScanner.scanBarcode(
                        "#ff6666", "Cancel", false, ScanMode.DEFAULT)
                    .then((barcoad) {
                  setState(() {
                    us = widget.userdata;
                    barcodeScanRes = barcoad;
                    _onQRViewCreated(barcodeScanRes!);
                  });
                });
              },
              child: Text('Add Attendance'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onQRViewCreated(String result) async {
    Map<String, dynamic> userMap = jsonDecode(result);
    _lec.attend(userMap);
    attendance(_lec);
  }

  Future<void> attendance(Lectur l) async {
    FirebaseFirestore.instance
        .collection('admin')
        .doc(l.Email)
        .collection('lecture')
        .doc(now.day.toString() +
            ":" +
            now.month.toString() +
            ":" +
            now.year.toString() +
            ":" +
            now.hour.toString() +
            ":" +
            l.Semester! +
            ":" +
            l.Subject!)
        .collection("Attend")
        .doc(us.number.toString())
        .set(
      {
        'Enrollment': us.number.toString(),
        'Name': us.name.toString(),
        'email': us.email.toString(),
      },
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //45064C
        // backgroundColor: Color(0xFFF45064C),
        title: Text('Attendance'),
        content: Text('Your Attedance taken Sucessfully'),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BaseHome(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
