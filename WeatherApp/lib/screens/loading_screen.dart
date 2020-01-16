import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

const Color gray = Color(0xFFDEE7EF);
const Color lightBlue = Color(0xFFD9E7FE);
const Color lightBlue2 = Color(0xFFF2F8FF);
const Color lightViolet = Color(0xFF535A92);
const Color darkGray = Color(0xFF8287AC);

//TODO: move somewhere else

final iconSize = 18.0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<Position> _verifyLocationAccess() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    return position;
  }

  void _openPermissionSettings() {
    PermissionHandler().openAppSettings();
  }

  void _checkLocationPermission() async {
    PermissionStatus locationPermission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse);

    print('location permission ' + locationPermission.toString());

    if (locationPermission != PermissionStatus.granted) {
      print('location permision is not granted?');
      _openPermissionSettings();
      //    await PermissionHandler()
      //        .requestPermissions([PermissionGroup.locationWhenInUse]);

    } else {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    }
  }

  Future<Map> _updateWeather() async {
    print('getting data ...');
    final url =
        "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";
    http.Response response = await http.get(url);
    print('----');

    return {
      'response': response,
      'statusCode': response.statusCode,
    };
  }

  @override
  void initState() {
    super.initState();

    _verifyLocationAccess().then((position) {
      print('position ' + position.toString());
    }).whenComplete(() {
      _updateWeather().then((response) {
        print(response);
      }).catchError((e) {
        print('something went wrong');
      });
    }).catchError((e) {
      _checkLocationPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            // TODO: make y transform dynamic
            transform: Matrix4.translationValues(0.0, -34.0, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
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
                Container(
                  transform: Matrix4.translationValues(0.0, 36.0, 10.0),
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
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                // location rounded button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-6.0, -90.0, 0.0),
                      padding: EdgeInsets.only(
                          left: 20.0, top: 20.0, right: 40, bottom: 20),
                      margin: EdgeInsets.only(right: 54.0),
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
                            blurRadius: 8.0,
                          )
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.chevron_left),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'St. Petersburg',
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
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('+3'),
                          Text('cloudy'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
