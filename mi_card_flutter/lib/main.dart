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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.call,
                      size: 24,
                      color: Colors.blueAccent,
                    ),
                    title: Text('+63 919 455 0938'),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.blue,
                        size: 24,
                      ),
                      title: Text('hello@dgtlmonk.dev')),
                ),
              ],
            ),
            alignment: Alignment(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
