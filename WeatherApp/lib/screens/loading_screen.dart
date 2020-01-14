import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Future<http.Response> _fetchPost() async {
  final url =
      'http://webpac.ksml.edu.tw/maintain/bookDetailAssdataAjax.do?id=1283659&viewDetailType=Details';
  final client = new HttpClient();
  final request = await client.getUrl(Uri.parse(url));
  final response = await request.close();
  print(response.statusCode);
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _checkLocationPermission() async {
    PermissionStatus locationPermission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse);

    if (locationPermission != PermissionStatus.granted) {
      PermissionHandler().openAppSettings();
      //    await PermissionHandler()
      //        .requestPermissions([PermissionGroup.locationWhenInUse]);

    } else {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    }
  }

  void _openPermissionSettings() {
    PermissionHandler().openAppSettings();
  }

  Future _getData() async {
    print('getting data ...');

    final url =
        "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";
    http.Response response = await http.get(url);
    print('----');

    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLocationPermission();
    _getData().then((value) {
      print(value);
    });
    _openPermissionSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
