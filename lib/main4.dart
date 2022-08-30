import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'confirm_order.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

const buttonHeight = 80.0;
const activecardColour = Color(0xFF1D1E33);
const inactivecardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  final String mail;
  InputPage({required this.mail});
  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String mssg = "aa";
  int food = 0;
  int lashes = 0;
  int clothes = 0;
  int collars = 0;
  int soaps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Products'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: inactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconContent(
                            icon: FontAwesomeIcons.bone, label: 'Dog Food'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (food > 0) food--;
                                  },
                                );
                              },
                            ),
                            Text(
                              food.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  //if (food < 1)
                                  food++;
                                  // else {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) => AlertDialog(
                                  //             title: Text('haha'),
                                  //           ));
                                  // }
                                });
                              },
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       _firestore.collection('products').add({
                        //         'name': "food",
                        //         'quantity': food,
                        //       });
                        //     },
                        //     child: Icon(
                        //       Icons.check,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: inactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconContent(icon: FontAwesomeIcons.dog, label: 'Leash'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (lashes > 0) lashes--;
                                  },
                                );
                              },
                            ),
                            Text(
                              lashes.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  lashes++;
                                });
                              },
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       _firestore.collection('products').add({
                        //         'name': "lashes",
                        //         'quantity': lashes,
                        //       });
                        //     },
                        //     child: Icon(
                        //       Icons.check,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: inactivecardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconContent(icon: FontAwesomeIcons.shirt, label: 'Clothes'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(
                            () {
                              if (clothes > 0) clothes--;
                            },
                          );
                        },
                      ),
                      Text(
                        clothes.toString(),
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            clothes++;
                          });
                        },
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       _firestore.collection('products').add({
                  //         'name': "clothes",
                  //         'quantity': clothes,
                  //       });
                  //     },
                  //     child: Icon(
                  //       Icons.check,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: inactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconContent(
                            icon: FontAwesomeIcons.dog, label: 'Collars'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (collars > 0) collars--;
                                  },
                                );
                              },
                            ),
                            Text(
                              collars.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  collars++;
                                });
                              },
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       _firestore.collection('products').add({
                        //         'name': "collars",
                        //         'quantity': collars,
                        //       });
                        //     },
                        //     child: Icon(
                        //       Icons.check,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconContent(
                            icon: FontAwesomeIcons.soap, label: 'Dog Soap'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (soaps > 0) soaps--;
                                  },
                                );
                              },
                            ),
                            Text(
                              soaps.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  soaps++;
                                });
                              },
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       _firestore.collection('products').add({
                        //         'name': "soaps",
                        //         'quantity': soaps,
                        //       });
                        //     },
                        //     child: Text(
                        //       'ok',
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   child:
          TextButton(
            onPressed: () {
              _firestore
                  .collection('orders')
                  .doc(widget.mail)
                  .collection('productOrders')
                  .add({
                'foodq': food,
                'lashesq': lashes,
                'clothesq': clothes,
                'collarsq': collars,
                'soapsq': soaps,
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Confirm(
                    mail: widget.mail,
                    food: food,
                    lashes: lashes,
                    clothes: clothes,
                    collars: collars,
                    soap: soaps,
                  ),
                ),
              );
            },
            child: Text(
              'Confirm',
            ),
          ),
          //   color: bottomContainerColour,
          //   margin: EdgeInsets.only(top: 10),
          //   width: double.infinity,
          //   height: buttonHeight,
          // ),
        ],
      ),
    );
  }
}

//
// class ReusableCard extends StatelessWidget {
//   ReusableCard({required this.colour, this.cardChild});
//   final Color colour;
//   final Widget? cardChild;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: cardChild,
//       margin: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: colour,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  late final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0XF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
