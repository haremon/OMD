import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:o_my_dog/rounded_button.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'constants.dart';
import 'main.dart';

final _firestore = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'omd',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images2/OMD-CIRCLE.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Log In',
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    if (await checkIfDocExists(email)) {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        _firestore
                            .collection('email')
                            .doc(_auth.currentUser!.email)
                            .set({'mail': email});
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(mail: email)));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(e.toString()),
                            ),
                          ),
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              'Your Account has been suspended or you have not registered!'),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  /// Check If Document Exists
  Future<bool> checkIfDocExists(String toCheck) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance.collection('email');

      var doc = await collectionRef.doc(toCheck).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}
