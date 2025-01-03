import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

const minBpm = 50;
const maxBpm = 200;

class _HomeScreen extends State<HomeScreen> {
  int bpm = 100;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  void _playBeep() {
    print("object");
    // await AudioPlayer().play(AssetSource("sound/beep.mp3"));
    SystemSound.play(SystemSoundType.click);
  }

  @override
  void dispose() {
    _timer.cancel();
    // _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/img/image_1.png",
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "$bpm bpm",
          style: TextStyle(
              fontSize: 70, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        Slider(
          value: bpm.floorToDouble(),
          onChanged: (double value) {
            setState(() {
              bpm = value.floor();
            });
          },
          min: minBpm.toDouble(),
          max: maxBpm.toDouble(),
          divisions: maxBpm - minBpm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => _playBeep()
                // _timer = Timer.periodic(
                //     Duration(milliseconds: (60000 / bpm).floor()),
                //     (Timer timer) {
                //   _playBeep();
                // });
                ,
                child: Text("클릭")),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _timer.cancel();
                },
                child: Text(
                  "멈춰!",
                ))
          ],
        )
      ],
    ));
  }
}
