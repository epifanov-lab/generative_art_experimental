import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/behavior.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/fly_base.dart';

import '../fly_utils.dart';

class Fly2 extends Fly with BehaviorDumb {

  static const FlyShape shape = FlyShape.CROSS;

  static const List<Color> COLORS = [
    Colors.red,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.orange,
    Colors.orangeAccent
  ];

  Fly2(double x, double y, double size, int speed, Color color) :
        super(x, y, size, speed, color);

  Fly2.random({ double x, double y, double size, int speed, Color color })
      : super.random(COLORS, x: x, y: y, size: size, speed: speed, color: color);

  @override
  void initialize() {
    paint.strokeWidth = RANDOM.nextDouble() * 3;
    paint.style = PaintingStyle.stroke;
  }

  @override
  void render(Canvas canvas) => FlyUtils.draw(canvas, shape, x, y, size, paint);

  @override
  void update(double t) => step(this);

  static List<Fly> spawn(int count, Size space) {
    List<Fly> result = List();
    do { result.add(Fly2.random());
    } while (result.length < count);
    return result;
  }

}