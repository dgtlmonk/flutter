import 'package:flutter/cupertino.dart';

class Weather {
  Weather({
    @required this.temperature,
    this.description,
  });

  final double temperature;
  final String description;

  static Weather fromMap(Map map) {
    return new Weather(
      temperature: map['temperature'],
      description: map['description'],
    );
  }
}
