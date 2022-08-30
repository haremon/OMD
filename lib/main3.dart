import 'package:flutter/material.dart';
import 'package:o_my_dog/bmi.dart';
import 'main4.dart';
import 'main5.dart';
import 'bmi.dart';
import 'bmi2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen3 extends StatelessWidget {
  final String mail;
  Screen3({required this.mail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
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
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFa8c0ff), Color(0xFF7A7ED1)]),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            child: Center(
              child: Image(
                height: 250,
                width: 300,
                image: AssetImage('images2/OMD-CIRCLE.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              //color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFA2B8F9),
                      border: Border.all(
                        color: Color(0xFF03001e),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BMICalculator(mail: widget.mail)));
                        },
                        child: ListTile(
                          leading: Text(
                            'Products',
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            //size: 100,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.bone,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF03001e),
                        width: 3,
                      ),
                      color: Color(0xFFA2B8F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BMICalculator2(mail: widget.mail)));
                        },
                        child: ListTile(
                          leading: Text(
                            'Services',
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            //size: 100,
                          ),
                          trailing: Icon(
                            Icons.medical_services_rounded,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Expanded(
// child: TextButton(
// onPressed: () {},
// child: Text('Products'),
// ),
// ),
// Expanded(
// child: TextButton(
// onPressed: () {},
// child: Text(
// 'Services',
// )),
// )
// ],
// ),
