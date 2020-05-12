import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMICalculator {
  final int personHeight;
  final int personWeight;
  double _bmi;

  BMICalculator({@required this.personHeight, @required this.personWeight});

  String calculateBMI() {
    _bmi = (personWeight / pow((personHeight / 100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25.0) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getRecommendation() {
    if (_bmi >= 25.0) {
      return 'You are overweight. Consider controling your diet and exercising more.';
    } else if (_bmi >= 18.5) {
      return 'Keep up the good work. Dont forget to exercise regularly.';
    } else {
      return 'You are underweight. Increase your diet, but make sure to exercise regularly.';
    }
  }
}
