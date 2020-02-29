import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flame_engine.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/behavior.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/game_object.dart';

import '../../../utils.dart';
import 'fly_utils.dart';

enum FlyShape { CROSS, RECTANGLE, CIRCLE, TRIANGLE }

abstract class Fly extends GameObject with Behavior {

  static const int MIN_SPEED = 1;
  static const int MAX_SPEED = 4;

  static const double MIN_SIZE = 8.0;
  static const double MAX_SIZE = 16.0;

  final int speed;

  final Color color;
  final Paint paint;

  final bool isRandom;

  Fly(double x, double y, double size, this.speed, this.color, { bool isRandom })
      : isRandom = isRandom ??= false, paint = Paint()..color = color, super(x, y, size) {
        initialize();
  }

  Fly.random(List<Color> colors,
             {double x, double y, double size, int speed, Color color})
      : this(
      x ?? RANDOM.nextDouble() * FlameEngine.screenSize.width,
      y ?? RANDOM.nextDouble() * FlameEngine.screenSize.height,
      size ?? MIN_SIZE + RANDOM.nextDouble() * (MAX_SIZE - MIN_SIZE),
      speed ?? MIN_SPEED + RANDOM.nextInt(MAX_SPEED - MIN_SPEED),
      color ?? Utils.getRandomColor(colors: colors),
      isRandom: true
  );

  Fly.copy(Fly other) : this(other.x, other.y, other.size, other.speed, other.color);

  void initialize();

  void render(Canvas canvas);

  void update(double t);

  void onTapDown() {
    // TODO implement
  }

  @override
  String toString() {
    return 'Fly{'
        ' _x: ${x.floor()}, _y: ${y.floor()}, '
        '_radius: ${size.floor()}, _color: $color}';
  }

}