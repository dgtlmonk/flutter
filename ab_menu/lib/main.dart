import 'package:ab_menu/screens/menu.dart';
import 'package:ab_menu/screens/splash-menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Athlete\s Bite Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
      routes: {
        MenuScreen.id: (context) => MenuScreen(),
        SplashMenu.id: (context) => SplashMenu()
      },
    );
  }
}
