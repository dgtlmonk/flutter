import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<Color> colors = [
    Colors.blue,
    Colors.blueGrey,
    Colors.orange,
    Colors.lightGreen,
    Colors.amberAccent,
    Colors.lightGreen,
    Colors.greenAccent,
    Colors.purple,
  ];

  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: <Widget>[
            for (var i = 1; i < colors.length; i++)
              Expanded(
                child: Container(
                  color: colors[i - 1],
                  width: 200,
                  child: FlatButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      player.play('note$i.wav');
                    },
                    child: Text('Play Sound'),
                  ),
                ),
              )
          ], crossAxisAlignment: CrossAxisAlignment.stretch),
        ),
      ),
    );
  }
}
