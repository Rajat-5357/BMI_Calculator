import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttontitle,@required this.onTap});
  final String buttontitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttontitle,
            style:kLargeButtonText,),
        ),
        color: Color(0xFFEB1555),
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10),
        height: kBottomheight,
        width: double.infinity,
      ),
    );
  }
}