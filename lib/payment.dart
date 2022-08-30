import 'package:flutter/material.dart';
import 'package:o_my_dog/payment2.dart';
import 'package:o_my_dog/payment3.dart';
import 'constants.dart';
import 'rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Payment extends StatefulWidget {
  final String mail;

  final int food;
  final int lashes;
  final int clothes;
  final int collars;
  final int soap;
  final int trainers;
  final int vets;
  final int vans;
  final int walkers;
  final int boarding;
  final int totall;

  Payment({
    required this.mail,
    required this.food,
    required this.lashes,
    required this.clothes,
    required this.collars,
    required this.soap,
    required this.trainers,
    required this.vets,
    required this.vans,
    required this.walkers,
    required this.boarding,
    required this.totall,
  });

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int number = 1;
  String expiry = "";
  int cvv = 1;
  final _formKey = GlobalKey<FormState>();
  var colorr = 0xFFFFFFFF;
  var colorr2 = 0xFFFFFFFF;
  var fieldsVisible = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  late String card;
  late String CVV;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                height: 50,
                child: Text(
                  'Payment',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Color(0xFF2D3D75),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.black,
                ),
                Text(
                  '-   -   -   - ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.black,
                  size: 40,
                ),
                Text(
                  ' -   -   -   -',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.grey,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    fieldsVisible = false;
                                    colorr = 0xFF000000;
                                    colorr2 = 0xFFFFFFFF;
                                  });
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.circle,
                                    color: Color(colorr),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Cash On Delivery',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
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
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    fieldsVisible = true;
                                    colorr2 = 0xFF000000;
                                    colorr = 0xFFFFFFFF;
                                  });
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.circle,
                                    color: Color(colorr2),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Card Payment',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
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
                  SizedBox(
                    height: 20,
                  ),
                  if (fieldsVisible)
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onFieldSubmitted: (value) => number = int.parse(value),
                        maxLength: 16,

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.black),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Card Number',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 16) {
                            return 'Please enter valid value for Card Number';
                          }
                          return null;
                        },
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (fieldsVisible)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              maxLength: 5,
                              decoration: InputDecoration(
                                counterStyle: TextStyle(color: Colors.black),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Expiry Date',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length != 5) {
                                  return 'Please enter valid value for Expiry Date (MM/YY)';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counterStyle: TextStyle(color: Colors.black),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'CVV',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length != 3) {
                                  return 'Please enter valid value for CVV';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 3,
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );

                              _firestore.collection('card').add({
                                'email': widget.mail,
                                'number': number,
                                'expiry': expiry,
                                'cvv': cvv,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => payment3(
                                          food: 0,
                                          lashes: 0,
                                          collars: 0,
                                          clothes: 0,
                                          soap: 0,
                                          boarding: 0,
                                          trainers: 0,
                                          vets: 0,
                                          vans: 0,
                                          walkers: 0,
                                          mail: widget.mail,
                                          total: widget.totall)));
                            }
                          },
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.shade500,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Complete Order: INR ' + widget.totall.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
