import 'dart:convert';

import 'package:clima/icons/meteocons_icons.dart';
import 'package:flutter/cupertino.dart';

class Weather {
  Weather({
    @required this.temperature,
    this.description,
    this.city,
    this.icon,
    this.tip,
  });

  final String city;
  final String description;
  final double temperature;
  final String tip;
  final IconData icon;

  // Pattern based of FlutterMates Flutter showcase
  static Weather fromResponse(String response) {
    var _json = json.decode(response).cast<String, dynamic>();
    var _weather = _json['weather'].cast<Map<String, dynamic>>()[0];
    var _main = _json['main'];

    return Weather.fromMap({
      'description': _weather['description'],
      'temperature': _main['temp'],
      'city': _json['name'],
      'id': _weather['id'],
    });
  }

  static Weather fromMap(Map map) {
    return new Weather(
      city: map['city'],
      description: map['description'],
      temperature: map['temperature'],
      tip: _getTip(map['temperature'].toInt()),
      icon: _getWeatherIcon(map['id']),
    );
  }

  static IconData _getWeatherIcon(int condition) {
    if (condition < 300) {
      return Meteocons.clouds_flash;
    } else if (condition < 400) {
      return Meteocons.drizzle;
    } else if (condition < 600) {
      return Meteocons.rain;
    } else if (condition < 616) {
      return Meteocons.snow;
    } else if (condition < 700) {
      return Meteocons.snow_heavy;
    } else if (condition < 800) {
      return Meteocons.mist;
    } else if (condition == 800) {
      return Meteocons.sun;
    } else if (condition <= 804) {
      return Meteocons.clouds;
    } else {
      return Meteocons.na;
    }
  }

  static String _getTip(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
