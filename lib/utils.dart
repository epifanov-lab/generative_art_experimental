import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {

  static Color getRandomColor() {
    // return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

}