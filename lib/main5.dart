import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'confirm_order.dart';
import 'confirm_services.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const buttonHeight = 80.0;
const activecardColour = Color(0xFF1D1E33);
const inactivecardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage2 extends StatefulWidget {
  final String mail;
  InputPage2({required this.mail});
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage2> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  int trainers = 0;
  int vets = 0;
  int van = 0;
  int vans = 0;
  int walkers = 0;
  int boarding = 0;
  Gender? selectedGender;

  // Color maleCardColour = inactivecardColour;
  // Color femaleCardColour = inactivecardColour;
  //
  // void updateColour(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColour == inactivecardColour) {
  //       maleCardColour = activecardColour;
  //       femaleCardColour = inactivecardColour;
  //     } else {
  //       maleCardColour = inactivecardColour;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColour == inactivecardColour) {
  //       femaleCardColour = activecardColour;
  //       maleCardColour = inactivecardColour;
  //     } else {
  //       femaleCardColour = inactivecardColour;
  //     }
  //   }
  // } //1=male,2=female

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Services'),
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
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activecardColour
                        : inactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconContent(
                            icon: FontAwesomeIcons.person, label: 'Trainers'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (trainers > 0) trainers--;
                                  },
                                );
                              },
                            ),
                            Text(
                              trainers.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (trainers < 3)
                                    trainers++;
                                  else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                  'You can only request service of maximum 3 trainers at a time!'),
                                            ));
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activecardColour
                        : inactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                              'You can only select upto 1 vet at a time!'),
                                        ));
                              },
                              icon: FontAwesomeIcons.info,
                            ),
                            IconContent(
                                icon: FontAwesomeIcons.userDoctor,
                                label: 'Vets'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.xmark,
                              onPressed: () {
                                setState(
                                  () {
                                    vets = 0;
                                  },
                                );
                              },
                            ),
                            Text(
                              vets.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.check,
                              onPressed: () {
                                setState(() {
                                  vets = 1;
                                });
                              },
                            ),
                          ],
                        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        'You can only select upto 1 van at a time!'),
                                  ));
                        },
                        icon: FontAwesomeIcons.info,
                      ),
                      IconContent(
                          icon: FontAwesomeIcons.vanShuttle,
                          label: 'Grooming Vans'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.xmark,
                        onPressed: () {
                          setState(
                            () {
                              vans = 0;
                            },
                          );
                        },
                      ),
                      Text(
                        vans.toString(),
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.check,
                        onPressed: () {
                          setState(() {
                            vans = 1;
                          });
                        },
                      ),
                    ],
                  ),
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
                            icon: FontAwesomeIcons.person,
                            label: 'Dog Walkers'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (walkers > 0) walkers--;
                                  },
                                );
                              },
                            ),
                            Text(
                              walkers.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (walkers < 3)
                                    walkers++;
                                  else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                  'You can only request service of maximum 3 walkers at a time!'),
                                            ));
                                  }
                                });
                              },
                            ),
                          ],
                        ),
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
                        Row(
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                              'The amount represents number of nights!'),
                                        ));
                              },
                              icon: FontAwesomeIcons.info,
                            ),
                            IconContent(
                                icon: FontAwesomeIcons.dog, label: 'Boarding'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (boarding > 0) boarding--;
                                  },
                                );
                              },
                            ),
                            Text(
                              boarding.toString(),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (boarding < 20)
                                    boarding++;
                                  else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                  'You can only avail boarding for maximum 20 days!'),
                                            ));
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              _firestore
                  .collection('orders')
                  .doc(widget.mail)
                  .collection('serviceOrders')
                  .add({
                'trainersq': trainers,
                'vetsq': vets,
                'vansq': vans,
                'walkersq': walkers,
                'boardingq': boarding,
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmUser(
                    mail: widget.mail,
                    trainers: trainers,
                    vets: vets,
                    vans: vans,
                    walkers: walkers,
                    boarding: boarding,
                  ),
                ),
              );
            },
            child: Text(
              'Confirm',
            ),
          ),
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
