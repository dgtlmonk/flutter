import 'package:clima/model/Weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather_client.dart';
import 'package:clima/widgets/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class PreloaderScreen extends StatefulWidget {
  @override
  _PreloaderScreenState createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  double latitude;
  double longitude;

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

      //TODO: Navigation.push
    }
  }

  // TODO: put in utils file
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

  Future _fetchWeatherData({double lon, double lat}) async {
    WeatherApiClient weatherApi = WeatherApiClient(
      url: _constructUrl(lon: lon.toString(), lat: lat.toString()),
    );

    try {
      Weather weather = await weatherApi.fetchWeatherUpdates();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(
            weather: weather,
            latlng: new LatLng(lat, lon),
          );
        }),
      );
    } catch (e) {
      print('something went wrong ' + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    _verifyLocationAccess().then((position) {
      latitude = position.latitude;
      longitude = position.longitude;

      //FIXME: do we really need this ?
//      setState(() {
//        latitude = position.latitude;
//        longitude = position.longitude;
//      });
//
      _fetchWeatherData(lat: latitude, lon: longitude);
    }).whenComplete(() {
      // do something else .... tb
    }).catchError((e) {
      _checkLocationPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        BackgroundWidget(),
        SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
      ]),
    );
  }
}
