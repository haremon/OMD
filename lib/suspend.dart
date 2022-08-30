import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: suspend(),
    );
  }
}

class suspend extends StatelessWidget {
  bool _giveVerse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Click on the Account you wish to suspend',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              //fontFamily: 'Pacifico',
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF536976), Color(0xFF292E49)],
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('email').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return TextButton(
                  onPressed: () {
                    print(document['mail']);
                    deleteUser(document['mail']);
                  },
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    document['mail'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Future<void> deleteUser(String mail) {
    CollectionReference users = FirebaseFirestore.instance.collection('email');
    return users
        .doc(mail)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
