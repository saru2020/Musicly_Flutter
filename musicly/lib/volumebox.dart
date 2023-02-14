import 'package:flutter/material.dart';

class VolumeBox extends StatefulWidget {
  VolumeBox({super.key, required this.onPressed});

  final VoidCallback onPressed;

  bool isOn = true;
  final ValueNotifier<bool> _isOn = ValueNotifier<bool>(true);

  @override
  State<VolumeBox> createState() => _VolumeBoxState();
}

class _VolumeBoxState extends State<VolumeBox> {
  Icon volumeIcon() {
    if (widget._isOn.value) {
      return const Icon(Icons.volume_up);
    }
    return const Icon(Icons.volume_off, color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            widget._isOn.value = !widget._isOn.value;
            widget.isOn = widget._isOn.value;
            setState(
                () {}); //this piece of code refreshes the current component
            widget.onPressed();
          },
          child: SizedBox(width: 60, height: 60, child: volumeIcon())),
    );
  }
}
