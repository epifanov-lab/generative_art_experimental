import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/base_fly.dart';

import 'fly_utils.dart';

class FlyAlpha extends Fly {

  static const FlyShape shape = FlyShape.CROSS;
  static const List<Color> COLORS = [
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent
  ];

  FlyAlpha(Size space, double x, double y, double size, int speed, Color color) :
        super(space, x, y, size, speed, color);

  FlyAlpha.random(Size space, { double x, double y, double size, int speed, Color color })
      : super.random(space, COLORS, x: x, y: y, size: size, speed: speed, color: color);

  @override
  void initialize() {
    paint.strokeWidth = RANDOM.nextDouble() * 3;
    paint.style = PaintingStyle.stroke;
  }

  @override
  void render(Canvas canvas) => FlyUtils.draw(canvas, shape, x, y, size, paint);

  static List<Fly> spawn(int count, Size space) {
    List<Fly> result = List();
    do { result.add(FlyAlpha.random(space));
    } while (result.length < count);
    return result;
  }

}