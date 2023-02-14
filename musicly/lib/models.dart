import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// abstract class EnumFuncs {
//   void icon();
//   // void soundFile();
// }

enum DataType {
  fire("fire"),
  rain("rain"),
  thunder("thunder"),
  wind("wind");

  final String value;

  const DataType(this.value);

  // @override
  // void icon() {
  //   print(value);
  //   return Icon(Icons.fireplace);
  // };
}

class Data {
  late DataType type;
  double iconSize = 50.0;

  Data({required this.type});

  Icon icon() {
    // print(value);
    if (type == DataType.fire) {
      return Icon(Icons.fireplace, size: iconSize);
    } else if (type == DataType.rain) {
      return Icon(Icons.water_drop_sharp, size: iconSize);
    } else if (type == DataType.thunder) {
      return Icon(Icons.thunderstorm, size: iconSize);
    } else if (type == DataType.wind) {
      return Icon(Icons.wind_power, size: iconSize);
    }
    return Icon(Icons.hourglass_empty, size: iconSize);
  }

  AssetSource soundSource() {
    // print(value);
    if (type == DataType.fire) {
      return AssetSource('Sounds/Fire.mp3');
    } else if (type == DataType.rain) {
      return AssetSource('Sounds/Rain.mp3');
    } else if (type == DataType.thunder) {
      return AssetSource('Sounds/Thunder.mp3');
    } else if (type == DataType.wind) {
      return AssetSource('Sounds/Wind.mp3');
    }
    return AssetSource('Sounds/Fire.mp3');
  }
}
