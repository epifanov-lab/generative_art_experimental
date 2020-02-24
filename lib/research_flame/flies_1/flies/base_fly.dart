import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

enum FlyShape { CROSS, RECTANGLE, CIRCLE, TRIANGLE }
enum Directions { N, NE, E, SE, S, SW, W, NW }

final Random RANDOM = Random();

abstract class Fly {
  final Size space;

  double x, y;
  int speed = -1;
  final double size;

  final Color color;
  final Paint paint;

  final bool isRandom;

  Fly(this.space, this.x, this.y, this.size, this.color, { bool isRandom })
      : isRandom = isRandom ??= false, paint = Paint()..color = color {
    initialize();
  }

  Fly.random(Size space, List<Color> colors) : this(space,
      RANDOM.nextDouble() * space.width,
      RANDOM.nextDouble() * space.height,
      8 + RANDOM.nextDouble() * 4,
      Utils.getRandomColor(colors: colors),
      isRandom: true
  );

  Fly.copy(Fly other) : this(other.space, other.x, other.y, other.size, other.color);

  void initialize();

  void render(Canvas canvas);

  void update(double t) {
    var horizontalDirection = RANDOM.nextBool() ? 1 : -1;
    var verticalDirection = RANDOM.nextBool() ? 1 : -1;
    var dx = speed * horizontalDirection;
    var dy = speed * verticalDirection;
    x += dx;
    y += dy;
  }

  @override
  String toString() {
    return 'Fly{_space: w${space.width.floor()} s${space.height.floor()},'
        ' _x: ${x.floor()}, _y: ${y.floor()}, '
        '_radius: ${size.floor()}, _color: $color}';
  }

}