import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/behavior.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/fly_base.dart';

import '../fly_utils.dart';

class Fly1 extends Fly with BehaviorChaotic {

  static const List<Color> COLORS = [
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent
  ];

  Fly1.random({ double size, double x, double y, int speed, Color color })
      : super.random(COLORS, size: size, x: x, y: y, speed: speed, color: color);

  @override
  void initialize() {
    paint.strokeWidth = RANDOM.nextDouble() * 3;
    paint.style = PaintingStyle.stroke;
  }

  @override
  void update(double t) => step(this);

  static List<Fly> spawn(int count, Size space) {
    List<Fly> result = List();
    do { result.add(Fly1.random());
    } while (result.length < count);
    return result;
  }

  @override
  void onTapDown() {
    // TODO: implement onTapDown
  }

}