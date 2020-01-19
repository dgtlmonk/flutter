import 'package:clima/icons/meteocons_icons.dart';
import 'package:clima/model/Weather.dart';
import 'package:clima/services/®weather_client.dart';
import 'package:clima/widgets/Background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// TODO put in const file
const Color gray = Color(0xFFDEE7EF);
const Color lightBlue = Color(0xFFD9E7FE);
const Color lightBlue2 = Color(0xFFF2F8FF);
const Color lightViolet = Color(0xFF535A92);
const Color darkGray = Color(0xFF8287AC);

final kAPIKey = "6edc6e89401d98df25b6ea5d5c81e85b";
final iconSize = 18.0;

// TODO: Unit option
// farenheit = units=imperial
// celcius = units=metric

String _constructUrl({String lon, String lat}) {
  return "https://api.openweathermap.org/data/2.5/weather?lat=" +
      lat +
      "&lon=" +
      lon +
      "&units=metric" +
      "&appid=6edc6e89401d98df25b6ea5d5c81e85b";
}

class LocationScreen extends StatefulWidget {
  LocationScreen({
    this.weather,
  });

  Weather weather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double latitude;
  double longitude;
  String temperature;
  String weatherDescription;

  Future _fetchWeatherData() async {
    WeatherApiClient weatherApi = WeatherApiClient(
      url: _constructUrl(
        lon: longitude.toString(),
        lat: latitude.toString(),
      ),
    );

    try {
      Weather weather = await weatherApi.fetchWeatherUpdates();
      setState(() {
        weatherDescription = weather.description;
        temperature = weather.temperature.toString();
      });
    } catch (e) {
      print('something went wrong');
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundWidget(),
          Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -38.0, 0),
                          padding: EdgeInsets.only(
                            left: 30.0,
                            top: 20.0,
                            bottom: 40.0,
                          ),
                          decoration: new BoxDecoration(
                            color: lightBlue,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.0),
                            ),
                          ),
                          child: Text(
                            'Weather',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w800,
                              color: lightViolet,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: lightBlue2,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 30.0,
                          right: 24,
                          left: 24.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.ellipsisV,
                              size: iconSize,
                              color: lightViolet,
                            ),
                            SizedBox(height: 40.0),
                            Icon(
                              FontAwesomeIcons.star,
                              color: lightViolet,
                              size: iconSize,
                            ),
                            SizedBox(height: 40.0),
                            Icon(
                              FontAwesomeIcons.share,
                              color: lightViolet,
                              size: iconSize,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    // location rounded button
                    Row(
//                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          transform:
                              Matrix4.translationValues(-6.0, -90.0, 0.0),
                          padding: EdgeInsets.only(
                              left: 20.0, top: 20.0, right: 40, bottom: 20),
                          // TODO: make auto compute
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28.0),
                              bottomRight: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12.0,
                              )
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: darkGray,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Pasig, Shaw Blvd',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: darkGray,
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    // temp display
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                              child: Column(
                            children: <Widget>[
                              Opacity(
                                opacity: 0.5,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          temperature ?? '--',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 90.0,
                                            color: lightViolet,
                                          ),
                                        ),
                                        Text(
                                          '°F',
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Icon(
                                          Meteocons.snow_heavy,
                                          size: 32.0,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          weatherDescription ?? '--',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              // Bottom Status
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              'NIGHT',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: lightViolet,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '23° ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Icon(Meteocons.snow_heavy),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              'MORN',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: lightViolet,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '23° ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Icon(Meteocons.windy_rain),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              'NOON',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: lightViolet,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '23° ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Icon(Meteocons.rain),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              'EVE',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: lightViolet,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '23° ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Icon(Meteocons.cloud_flash),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
