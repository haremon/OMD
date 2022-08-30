import 'dart:math';

import 'package:flutter/material.dart';
import 'package:o_my_dog/suspend.dart';

import 'main2.dart';

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red.shade600,
      //   leading: Text(
      //     'Welcome!',
      //   ),
      // ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome  Admin!',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                setState(() {});
              },
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images2/admin.png'),
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
            SizedBox(
              height: 50,
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => suspend()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.supervisor_account,
                    //size: 100,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    'Suspend Accounts',
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
            // TextButton(
            //   onPressed: () {
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => ()));
            //   },
            //   child: Card(
            //     color: Colors.white,
            //     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
            //     child: ListTile(
            //       leading: Icon(
            //         Icons.check,
            //         //size: 100,
            //         color: Colors.teal.shade900,
            //       ),
            //       title: Text(
            //         'Lets Get Started',
            //         style: TextStyle(
            //           color: Colors.teal.shade900,
            //           fontFamily: 'Source Sans Pro',
            //           fontSize: 20,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
