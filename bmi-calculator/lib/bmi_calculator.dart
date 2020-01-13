import 'dart:math';

const Map bmiStatus = {
  'low': {
    'status': 'LOW',
    'text': 'You are underweight! Need to bulk buddy!',
  },
  'normal': {
    'status': 'NORMAL',
    'text': 'You have a normal body weight.\n Good job!',
  },
  'high': {
    'status': 'HIGH',
    'text': 'Golly! You are overweight!',
  }
};

class BmiCalculator {
  BmiCalculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  Map getResult() {
    if (_bmi >= 25) {
      return bmiStatus['high'];
    } else if (_bmi > 18.5) {
      return bmiStatus['normal'];
    } else {
      return bmiStatus['low'];
    }
  }
}
