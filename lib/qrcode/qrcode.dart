import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlineid/qrcode/qrcontroller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  Map<String, dynamic>? data;
  @override
  void initState() {
    TicketController().getTicketData().then((value) {
      data = value;
      print(data);
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devloper'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Scan Me!',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
          ),
          Center(
            child: Text(
              'Ticket',
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
          ),
          data == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : QrImage(
                  backgroundColor: Colors.white,
                  data: jsonEncode(data),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
          Text(
            DateTime.now().toString(),
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
