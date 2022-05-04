import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutus extends StatefulWidget {
  aboutus({Key? key}) : super(key: key);

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devloper'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Devloper',
                        style: TextStyle(fontSize: 20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/hackathon-86123.appspot.com/o/Images%2FDevloper%2Fjinayshah.jpeg?alt=media&token=789aa394-baaa-49ad-b220-b70845d5b27f'), //transparant
                      radius: 70,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Jinay Shah',
                        style: TextStyle(fontSize: 20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/jinay-shah-5389a01ba/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Connect on LinkedIn",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(10),
          //   child: Card(
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.all(5),
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(
          //               'Team Member',
          //               style: TextStyle(fontSize: 20),
          //             ),
          //             width: MediaQuery.of(context).size.width * 0.9,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(5),
          //           child: CircleAvatar(
          //             // backgroundColor: Colors.blue, //transparant
          //             // child: Image(
          //             //   image: NetworkImage(
          //             //       'https://firebasestorage.googleapis.com/v0/b/hackathon-86123.appspot.com/o/Images%2FDevloper%2FIMG_20220409_154716.jpg?alt=media&token=797cdc92-2596-45b4-ac64-abd9ce425feb'),
          //             // ),
          //             backgroundImage: NetworkImage(
          //                 'https://firebasestorage.googleapis.com/v0/b/hackathon-86123.appspot.com/o/Images%2FDevloper%2FIMG_20220226_084020.jpg?alt=media&token=4101cb26-0ec5-44de-aade-7607d2beefb2'),
          //             radius: 70,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(5),
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(
          //               'Akshay Jikadra',
          //               style: TextStyle(fontSize: 20),
          //             ),
          //             width: MediaQuery.of(context).size.width * 0.9,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(5),
          //           child: InkWell(
          //             onTap: () async {
          //               const url =
          //                   'https://www.linkedin.com/in/akshay-jikadara-b4a2b0202/';
          //               if (await canLaunch(url)) {
          //                 await launch(url);
          //               }
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.blue,
          //                   borderRadius:
          //                       BorderRadius.all(Radius.circular(14))),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(
          //                   "Connect on LinkedIn",
          //                   style: TextStyle(
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
