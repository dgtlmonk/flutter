import 'package:clima/widgets/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyLocationAccess().then((position) {
      latitude = position.latitude;
      longitude = position.longitude;

      print("long " + longitude.toString() + " lat " + latitude.toString());
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
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
