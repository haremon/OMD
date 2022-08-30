import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const textstyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label ?? '',
          style: textstyle,
        ),
      ],
    );
  }
}
