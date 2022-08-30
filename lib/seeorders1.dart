import 'package:flutter/material.dart';
import 'package:o_my_dog/login_admin.dart';
import 'package:o_my_dog/rounded_button.dart';
import 'package:o_my_dog/seeOrders.dart';
import 'package:o_my_dog/seeservices.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class seeorders1 extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<seeorders1>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFff9966),
            Color(0xFFff5e62).withOpacity(1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Hero(
                    tag: 'omd',
                    child: Container(
                      child: Image.asset('images2/OMD-CIRCLE.png'),
                      height: animation.value * 150,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [TypewriterAnimatedText('O-My-Dog!')],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => seeorders()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF03001e),
                      width: 3,
                    ),
                    color: Colors.deepOrange.shade500,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Check Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => seeservices()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF03001e),
                      width: 3,
                    ),
                    color: Colors.deepOrange.shade500,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Check Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
