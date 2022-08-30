import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o_my_dog/payment.dart';

import 'main3.dart';

class payment3 extends StatefulWidget {
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

  payment3(
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

class _paymentState extends State<payment3> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double vat = widget.total * 0.15;
    double totall = vat + widget.total;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                height: 50,
                child: Text(
                  'Confirmation',
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
                    color: Colors.black,
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
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.black,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 80,
                        ),
                        Positioned(
                          left: 18,
                          top: 27,
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Hey ' +
                        widget.mail.toString() +
                        ", " +
                        "\n" +
                        "Thank you for your purchase.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              widget.total.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VAT (15%)',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              vat.toString(),
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
                          thickness: 2,
                          color: Colors.grey,
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
                        Text(
                          'Do Order Again!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            fontFamily: 'Source Sans Pro',
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(
                          height: 90,
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
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Screen3(
                                      mail: 'Default',
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 300,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.shade500,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Order Again',
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
