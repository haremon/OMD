//this file incluedes 004,006,008

import 'dart:ui';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o_my_dog/admin1.dart';
import 'package:o_my_dog/payment2.dart';
import 'package:o_my_dog/registration_screen.dart';
import 'package:o_my_dog/seeOrders.dart';
import 'package:o_my_dog/seeorders1.dart';
import 'package:o_my_dog/suspend.dart';

import 'login_screen.dart';
import 'main2.dart';
import 'quizbrain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.mail}) : super(key: key);
  final String mail;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red.shade600,
      //   leading: Text(
      //     'Welcome!',
      //   ),
      // ),
      backgroundColor: Colors.red.shade300,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome  ' + widget.mail + '!',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  number = Random().nextInt(5) + 1;
                });
              },
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images2/$number.jpg'),
              ),
            ),
            Text(
              'O-My-Dog!',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'A One Stop Solution',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: Divider(
                color: Colors.teal.shade50,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  //size: 100,
                  color: Colors.teal.shade900,
                ),
                title: Text(
                  '7291041190',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  //size: 100,
                  color: Colors.teal.shade900,
                ),
                title: Text(
                  'contactus@omd.com',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => seeorders1()));
              },
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.eye,
                    //size: 100,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    'See Orders',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen2(mail: widget.mail)));
              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
                child: ListTile(
                  leading: Icon(
                    Icons.check,
                    //size: 100,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    'Lets Get Started',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
