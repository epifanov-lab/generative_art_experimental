import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/behavior.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/fly_base.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/game_object.dart';

import '../fly_utils.dart';

class Fly2 extends Fly with BehaviorDumb {

  static const List<Color> COLORS = [
    Colors.white
  ];

  Fly2.random({ double size, double x, double y, int speed, Color color })
      : super.random(COLORS, shape: ObjectsShape.CROSS, size: size, x: x, y: y, speed: speed, color: color);

  @override
  void initialize() {
    paint.strokeWidth = RANDOM.nextDouble() * 3;
    paint.style = PaintingStyle.stroke;
  }

  @override
  void update(double t) {
    step(this);
  }

  static List<Fly> spawn(int count, Size space) {
    List<Fly> result = List();
    do { result.add(Fly2.random());
    } while (result.length < count);
    return result;
  }

  @override
  void onTapDown() {
    // TODO: implement onTapDown
  }

}