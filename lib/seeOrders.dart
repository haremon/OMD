import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(seeorders());
}

class seeorders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: check(),
    );
  }
}

class check extends StatelessWidget {
  bool _giveVerse = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Orders")),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  .doc(_auth.currentUser?.email)
                  .collection('productOrders')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Products placed are',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source Sans Pro',
                                color: Colors.teal,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Food: ' + document['foodq'].toString(),
                              style: TextStyle(
                                color: Colors.brown,
                                fontFamily: 'Pacifico',
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Leashes: ' + document['lashesq'].toString(),
                              style: TextStyle(
                                color: Colors.brown,
                                fontFamily: 'Pacifico',
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Clothes: ' + document['clothesq'].toString(),
                              style: TextStyle(
                                color: Colors.brown,
                                fontFamily: 'Pacifico',
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Collars: ' + document['collarsq'].toString(),
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontFamily: 'Pacifico',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Soaps: ' + document['soapsq'].toString(),
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontFamily: 'Pacifico',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance
          //       .collection('orders')
          //       .doc(_auth.currentUser?.email)
          //       .collection('serviceOrders')
          //       .snapshots(),
          //   builder:
          //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (!snapshot.hasData) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else {
          //       return ListView(
          //         children: snapshot.data!.docs.map((document) {
          //           return TextButton(
          //             onPressed: () {},
          //             child: Center(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   SizedBox(
          //                     height: 40,
          //                   ),
          //                   Text(
          //                     'Service placed for user ' +
          //                         document['email'] +
          //                         ' are:',
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontFamily: 'Source Sans Pro',
          //                       color: Colors.teal,
          //                       fontSize: 18,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 20,
          //                   ),
          //                   Text(
          //                     'Trainers: ' + document['trainsersq'].toString(),
          //                     style: TextStyle(
          //                       color: Colors.brown,
          //                       fontFamily: 'Pacifico',
          //                       fontSize: 18,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Text(
          //                     'Vets: ' + document['vetsq'].toString(),
          //                     style: TextStyle(
          //                       color: Colors.brown,
          //                       fontFamily: 'Pacifico',
          //                       fontSize: 18,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Text(
          //                     'Vans: ' + document['vansq'].toString(),
          //                     style: TextStyle(
          //                       color: Colors.brown,
          //                       fontFamily: 'Pacifico',
          //                       fontSize: 18,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Text(
          //                     'Walkers: ' + document['walkersq'].toString(),
          //                     style: TextStyle(
          //                       color: Colors.brown,
          //                       fontSize: 18,
          //                       fontFamily: 'Pacifico',
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Text(
          //                     'Boardings (Number of Nights): ' +
          //                         document['boardingq'].toString(),
          //                     style: TextStyle(
          //                       color: Colors.brown,
          //                       fontSize: 18,
          //                       fontFamily: 'Pacifico',
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           );
          //         }).toList(),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
