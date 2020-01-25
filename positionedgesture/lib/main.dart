import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(width: 120, height: 120, color: Colors.lightBlue),
              Positioned(
                top: 80.0,
                width: 100,
                height: 50,
                child: GestureDetector(
                    onTap: () {
                      print('ok');
                    },
                    child: Container(
                      color: Colors.purple,
                      child: Text(
                        'Clickety Click',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
