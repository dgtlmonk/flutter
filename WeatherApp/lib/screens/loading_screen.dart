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
  Future _verifyLocationAccess() async {
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

  Future _getData() async {
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

    _verifyLocationAccess().whenComplete(() {
      _getData().then((response) {
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
