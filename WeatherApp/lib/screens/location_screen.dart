import 'package:clima/constants/constants.dart';
import 'package:clima/icons/meteocons_icons.dart';
import 'package:clima/model/Weather.dart';
import 'package:clima/widgets/Background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({
    this.weather,
  });

  final Weather weather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _toStringTemperature({double temperature}) {
    return temperature.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              color: kLightBlue,
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
                                color: kLightViolet,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Container(
                          decoration: new BoxDecoration(
                            color: kLightBlue2,
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
                                size: kIconSize,
                                color: kLightViolet,
                              ),
                              SizedBox(height: 40.0),
                              Icon(
                                FontAwesomeIcons.star,
                                color: kLightViolet,
                                size: kIconSize,
                              ),
                              SizedBox(height: 40.0),
                              Icon(
                                FontAwesomeIcons.share,
                                color: kLightViolet,
                                size: kIconSize,
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
                                  color: kDarkGray,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Pasig, Shaw Blvd',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: kDarkGray,
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
                                            _toStringTemperature(
                                                    temperature: widget
                                                        .weather.temperature) ??
                                                '--',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 90.0,
                                              color: kLightViolet,
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
                                            widget.weather.icon,
                                            size: 32.0,
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            widget.weather.description ?? '--',
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
                                                  color: kLightViolet,
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  color: kLightViolet,
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  color: kLightViolet,
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  color: kLightViolet,
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
      ),
    );
  }
}
