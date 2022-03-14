import 'package:flutter/material.dart';
import 'constants.dart';
class createicon extends StatelessWidget {
  createicon({this.icon,this.lable});
  final IconData icon;
  final String lable;
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
          height: 10.0,
        ),
        Text(lable,
          style:kLableTextStyle, ),
      ],
    );
  }
}