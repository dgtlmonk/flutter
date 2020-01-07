import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final stageWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Joel J. Pablo',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 22,
                      fontFamily: 'Amalfi',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'FLUTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Belgrad',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Card(
                  color: Colors.white,
//                  width: stageWidth * .75,

                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//                  margin: EdgeInsets.all(10),
//                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.call,
                            size: 24,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text('+63 919 455 0938')
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
//                  width: stageWidth * .75,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.email,
                            color: Colors.blue,
                            size: 24,
                          ),
                        ),
                        Text('hello@dgtlmonk.dev')
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                )
              ],
              // alignItems
              mainAxisAlignment: MainAxisAlignment.center,
              // flexGrow
//              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
            alignment: Alignment(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}

//
//
//p      home: Scaffold(
//appBar: AppBar(
//backgroundColor: Colors.grey,
//title: Text("Demo App"),
//),
//backgroundColor: Colors.white,
//body: SafeArea(
//child: Container(
//color: Colors.blueGrey,
//child: Column(
//children: <Widget>[
//Container(
//color: Colors.white,
//padding: EdgeInsets.all(10),
//margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//child: Text("hey"),
//),
//Container(
//color: Colors.white,
//padding: EdgeInsets.all(10),
//margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//child: Text("hey"),
//),
//Container(
//color: Colors.white,
//padding: EdgeInsets.all(10),
//margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//child: Text("hey"),
//),
//],
//// alignItems
//mainAxisAlignment: MainAxisAlignment.center,
//// flexGrow
//crossAxisAlignment: CrossAxisAlignment.stretch,
//),
//alignment: Alignment(0.0, 0.0),
//),
//),
//
