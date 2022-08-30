import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:o_my_dog/payment.dart';

class payment2 extends StatefulWidget {
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
  final int total;

  payment2(
      {required this.mail,
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
      required this.total});

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment2> {
  String address = "";
  String country = "";
  String city = "";
  int zip = 0;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int totall = widget.total + 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                height: 50,
                child: Text(
                  'Shipping',
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
                  '-   -   -   -',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.grey,
                  size: 40,
                ),
                Text(
                  '-   -   -   -',
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
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
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
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
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
                      onFieldSubmitted: (value) => address = value,
                      //onFieldSubmitted: (value) => print(value),
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Address',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
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
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            onFieldSubmitted: (value) => city = value,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'City',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            onFieldSubmitted: (value) => zip = int.parse(value),
                            maxLength: 6,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'ZIP Code',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
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
                      onFieldSubmitted: (value) => country = value,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Country',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Additional Shipping Charges',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'INR 100',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              totall.toString(),
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Material(
                          elevation: 20,
                          color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 25,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  _firestore.collection('shipping').add({
                                    'email': widget.mail,
                                    'address': address,
                                    'city': city,
                                    'zip': zip,
                                    'country': country,
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Payment(
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
                                        totall: totall,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: 300,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.shade500,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Continue To Payment',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
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
