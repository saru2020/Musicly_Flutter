import 'package:musicly/models.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundBox extends StatefulWidget {
  late Data data;
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

  Color myColor() {
    if (widget.isPlaying) {
      return Colors.green;
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
      child: GestureDetector(
          onTap: () {
            print("container clicked");
            play();
            // refresh();
            // setState(() {}); //this piece of code refreshes the current component
          },
          child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red), color: myColor()),
              child: widget.data.icon())),
    );
  }
}
