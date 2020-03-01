import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flame_engine.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/behavior.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/game_object.dart';

import '../../../utils.dart';
import 'fly_utils.dart';

abstract class Fly extends GameObject with Behavior {

  static const int MIN_SPEED = 1;
  static const int MAX_SPEED = 4;

  static const double MIN_SIZE = 8.0;
  static const double MAX_SIZE = 16.0;

  final int speed;

  final Color color;

  final bool isRandom;

  Fly(ObjectsShape shape, double size, double x, double y, this.speed, this.color, { bool isRandom })
      : isRandom = isRandom ??= false, super(shape, size, x, y) {
        paint.color = color;
        initialize();
  }

  Fly.random(List<Color> colors,
             {ObjectsShape shape, double size, double x, double y, int speed, Color color})
      : this(
      shape ?? ObjectsShape.CROSS,
      size ?? MIN_SIZE + RANDOM.nextDouble() * (MAX_SIZE - MIN_SIZE),
      x ?? RANDOM.nextDouble() * FlameEngine.screenSize.width,
      y ?? RANDOM.nextDouble() * FlameEngine.screenSize.height,
      speed ?? MIN_SPEED + RANDOM.nextInt(MAX_SPEED - MIN_SPEED),
      color ?? Utils.getRandomColor(colors: colors),
      isRandom: true
  );

  Fly.copy(Fly other) : this(other.shape, other.size, other.x, other.y, other.speed, other.color);

  @override
  String toString() {
    return 'Fly{'
        ' _x: ${x.floor()}, _y: ${y.floor()}, '
        '_radius: ${size.floor()}, _color: $color}';
  }

}