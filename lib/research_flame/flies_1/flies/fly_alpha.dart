import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/base_fly.dart';

class FlyAlpha extends Fly {

  static const List<Color> COLORS = [
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent
  ];

  FlyAlpha(Size space, double x, double y, double size, Color color) : super(space, x, y, size, color);
  FlyAlpha.random(Size space) : super.random(space, COLORS);

  @override
  void initialize() {
    speed = 3;
    paint.strokeWidth = RANDOM.nextDouble() * 3;
    paint.style = PaintingStyle.stroke;
  }

  @override
  void render(Canvas canvas) {
    Path path = Path()
      ..moveTo(x - size / 2, y)
      ..lineTo(x + size / 2, y)
      ..moveTo(x, y - size / 2)
      ..lineTo(x, y + size / 2)
      ..close();
    canvas.drawPath(path, paint);
  }

  static List<Fly> spawn(int count, Size space) {
    List<Fly> result = List();
    do { result.add(FlyAlpha.random(space));
    } while (result.length < count);
    return result;
  }

}