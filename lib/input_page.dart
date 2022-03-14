import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reuseablecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Gender selectedgender;
int height=180;
int weight=60;
int age=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:
          Row(
            children: <Widget>[
              Expanded(child: Reusecard(
                onPress: (){
                  setState(() {
                    selectedgender=Gender.male;
                  });
                },
                colour: selectedgender==Gender.male?kActivecardcolor:kInactivecardcolor,
              cardchild: createicon(
                icon: FontAwesomeIcons.mars,
                lable: "MALE",
              ),),),
              Expanded(child: Reusecard(
                onPress: (){
                  setState(() {
                    selectedgender=Gender.female;
                  });
                },
                colour: selectedgender==Gender.female?kActivecardcolor:kInactivecardcolor,
             cardchild: createicon(
               icon: FontAwesomeIcons.venus,
               lable: "FEMALE",
             ), ),),
            ],
          ),),
          Expanded(child: Reusecard(
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,


              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kLableTextStyle,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                    style:kNumberTextStyle),
                    Text('cm',
                    style: kLableTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue){
                    setState(() {
                      height=newValue.round();
                    });
                      }),
                )
              ],
            ),
            colour: kActivecardcolor,),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reusecard(
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',
                    style: kLableTextStyle,),
                    Text(weight.toString(),
                    style: kNumberTextStyle,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          onPressed:(){
                            setState(() {
                              weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                          icon: FontAwesomeIcons.plus,),
                      ],
                    )
                  ],
                ),
                colour: kActivecardcolor,),),
              Expanded(child: Reusecard(
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',
                      style: kLableTextStyle,),
                    Text(age.toString(),
                      style: kNumberTextStyle,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          onPressed:(){
                            setState(() {
                              age--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                          icon: FontAwesomeIcons.plus,),
                      ],
                    )
                  ],
                ),
                colour: kActivecardcolor,),),
            ],
          ),),

          BottomButton(buttontitle: "CALCULATE",onTap: (){
            CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Results(bmiresult: calc.bmicalculator(),resulttext: calc.getResult(),interpretation: calc.getinterpretation(),);
            }));
          },),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
        onPressed: onPressed,
        elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

