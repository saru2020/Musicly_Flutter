import 'dart:math';

import 'package:musicly/models.dart';
import 'package:musicly/soundbox.dart';
import 'package:musicly/volumebox.dart';
import 'package:flutter/material.dart';

class Util {
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SoundBox fire = SoundBox(data: Data(type: DataType.fire));
  SoundBox rain = SoundBox(data: Data(type: DataType.rain));
  SoundBox thunder = SoundBox(data: Data(type: DataType.thunder));
  SoundBox wind = SoundBox(data: Data(type: DataType.wind));
  late VolumeBox volumeBox;

  void volumePressed() {
    fire.volume(volumeBox.isOn);
    rain.volume(volumeBox.isOn);
    thunder.volume(volumeBox.isOn);
    wind.volume(volumeBox.isOn);
  }

  @override
  void initState() {
    super.initState();
    volumeBox = VolumeBox(onPressed: volumePressed);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          title: const Text("Musicly"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: volumeBox,
            ),
            // const Padding(padding: EdgeInsets.all(20)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  fire,
                  const Padding(padding: EdgeInsets.all(10)),
                  rain
                ]),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  thunder,
                  const Padding(padding: EdgeInsets.all(10)),
                  wind
                ])
          ],
        ),
      ),
    );
  }
}
