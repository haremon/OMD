import 'dart:ui';
import 'quizbrain.dart';
import 'main3.dart';
import 'package:flutter/material.dart';

QuizBrain qb = new QuizBrain();

class Screen2 extends StatelessWidget {
  final String mail;
  Screen2({required this.mail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Test(mail: mail),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  final String mail;
  Test({required this.mail});
  @override
  _TestPage createState() => _TestPage();
}

class _TestPage extends State<Test> {
  List<Icon> score = [];

  void display() {
    setState(
      () {
        if (qb.exceed()) {
          qb.reset();
          score.clear();
        } else {
          score.add(
            Icon(
              Icons.check,
              color: Colors.white,
            ),
          );

          qb.nexttest();
        }
      },
    );
  }

  int image() {
    return qb.getnumber();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CircleAvatar(
          radius: 160,
          backgroundImage: AssetImage('images2/img${qb.getnumber()}.jpg'),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.gettest(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 35.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              color: Colors.red.shade300,

              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                display();
              },
              //The user picked false.
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(140, 10, 125, 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen3(mail: widget.mail)));
              },
              //The user picked false.
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: score,
        ),
      ],
    );
  }
}
