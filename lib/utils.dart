import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'research_flame/flies_1/flies/base_fly.dart';

class Utils {

  static Color getRandomColor({ List<Color> colors, Color defColor = Colors.black }) {
    if (colors == null || colors.isEmpty) return defColor;
    else return colors[RANDOM.nextInt(colors.length)];
    //Colors.primaries
  }

}