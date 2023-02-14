import 'package:musicly/models.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundBox extends StatefulWidget {
  late Data data;
  double currentSliderValue = 60;
  bool isPlaying = false;
  final player = AudioPlayer();

  void volume(bool isOn) async {
    if (isOn) {
      await player.setVolume(1);
    } else {
      await player.setVolume(0);
    }
  }

  SoundBox({super.key, required this.data});

  @override
  State<SoundBox> createState() => _SoundBoxState();
}

class _SoundBoxState extends State<SoundBox> {
  void play() async {
    await widget.player.setSource(widget.data.soundSource());
    if (widget.isPlaying) {
      await widget.player.pause();
      widget.isPlaying = false;
      // setState(() {}); //this piece of code refreshes the current component
    } else {
      await widget.player.resume();
      widget.isPlaying = true;
    }
    refresh();
  }

  Future<void> updateVolume() async {
    return await widget.player.setVolume(widget.currentSliderValue / 100);
  }

  Color myColor() {
    if (widget.isPlaying) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  void refresh() {
    setState(() {}); //this piece of code refreshes the current component
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                print("container clicked");
                play();
              },
              child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red), color: myColor()),
                  child: widget.data.icon())),
          Container(
            width: 170,
            child: Slider(
              value: widget.currentSliderValue,
              max: 100,
              divisions: 100,
              label: widget.currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  widget.currentSliderValue = value;
                  // widget.onVolumeSliderChange();
                  // updateVolume();
                  updateVolume()
                      .then((success) {})
                      .catchError((e) {})
                      .whenComplete(() {
                    print("slider value changed");
                    print(widget.currentSliderValue.round());
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
