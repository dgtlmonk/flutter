import 'package:clima/icons/meteocons_icons.dart';
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
    Response response = await get(this.url);

    if (response.statusCode == 200) {
      return Weather.fromResponse(response.body);
    }

    return Weather.fromMap(
      {
        'description': 'failed to connect.',
        'temperature': '--',
        'icon': Meteocons.na,
        'city': '--'
      },
    );
  }
}
