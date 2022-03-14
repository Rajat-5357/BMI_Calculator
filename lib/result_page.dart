
import 'package:bmi_calculator/reuseablecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_button.dart';
class Results extends StatelessWidget {
  Results({@required this.bmiresult,@required this.resulttext,@required this.interpretation});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("BMI CALCULATOR"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result",
            style: kTitlePageText,),
          ),),
          Expanded(flex:5,
            child: Reusecard(

            colour: Color(0xFF1D1E33),
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resulttext,
                style: kTitletextResult,),
                Text(bmiresult,
                style: kBMITextstyle,),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),),
          Expanded(child: BottomButton(buttontitle: "RE_CALCULATE",onTap: (){
            Navigator.pop(context);
          },),)
        ],
      ),
    );
  }
}
