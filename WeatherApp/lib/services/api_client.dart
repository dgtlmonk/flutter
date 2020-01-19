import 'dart:convert';

import 'package:clima/model/Weather.dart';
import 'package:http/http.dart';

class WeatherAPIResponse {
  var data;
  String statusCode;

  WeatherAPIResponse({
    this.data,
    this.statusCode,
  });
}

class WeatherApiClient {
  WeatherApiClient({this.url});

  final String url;

  // FIXME: lon, lat params instead
  Future<Weather> fetchWeatherUpdates() async {
    print('fetching weather updates ...');

    Response response = await get(this.url);

    var decodedJson = json.decode(response.body); //.cast<String, dynamic>();
    var _weather = decodedJson['weather'].cast<Map<String, dynamic>>()[0];
    var _main = decodedJson['main'];

    if (response.statusCode == 200) {
      return Weather.fromMap({
        'description': _weather['description'],
        'temperature': _main['temp'],
      });
    }

    return Weather.fromMap(
      {'description': 'failed to connect', 'temperature': '--'},
    );
  }

  // TODO: Future reference
//  static String _capitalize(String input) {
//    return input.substring(0, 1).toUpperCase() + input.substring(1);
//  }
}
