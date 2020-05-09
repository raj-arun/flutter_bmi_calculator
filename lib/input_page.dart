import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int personHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardColumn: IconContent(
                      cardIcon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardColumn: IconContent(
                      cardIcon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardColumn: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          //baseline property has to be set when using Alignment baseline option
                          children: <Widget>[
                            Text(
                              personHeight.toString(),
                              style: kFeaturesTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          //get the current slider context and change the elements you need to
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kIconTxtColour,
                            thumbColor: kBottomContainerColour,
                            overlayColor: kSliderOverlayColour,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 14),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25),
                          ),
                          child: Slider(
                              value: personHeight.toDouble(),
                              min: kSliderMin,
                              max: kSliderMax,
                              onChanged: (double newValue) {
                                setState(() {
                                  personHeight = newValue.round();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardColumn: HeightWeightIconContent(
                      iconLabel: 'WEIGHT',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardColumn: HeightWeightIconContent(
                      iconLabel: 'AGE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColour,
            width: double.infinity,
            height: kBottomContainerHeight,
            margin: EdgeInsets.only(top: 10.0),
            child: Center(
                child: Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}

class HeightWeightIconContent extends StatelessWidget {
  HeightWeightIconContent({@required this.iconLabel});

  final String iconLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          iconLabel,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF8D8E98),
          ),
        ),
        Text(
          '85',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.minusCircle,
              size: 40,
            ),
            Icon(
              FontAwesomeIcons.plusCircle,
              size: 40,
            ),
          ],
        )
      ],
    );
  }
}
