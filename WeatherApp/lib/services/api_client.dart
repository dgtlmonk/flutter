import 'dart:convert';

import 'package:http/http.dart';

class WeatherApiClient {
  WeatherApiClient({this.url});

  final String url;

  // FIXME: lon, lat params instead
  Future<Map> fetchWeatherUpdates() async {
    print('fetching weather updates ...');

    Response response = await get(this.url);

    if (response.statusCode == 200) {
      return {
        'data': jsonDecode(response.body),
        'statusCode': response.statusCode,
      };
    }

    return {'statusCode': response.statusCode};
  }
}
