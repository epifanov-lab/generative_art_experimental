import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

enum FlyShape { CROSS, RECTANGLE, CIRCLE, TRIANGLE }
enum Directions { N, NE, E, SE, S, SW, W, NW }

final Random RANDOM = Random();

abstract class Fly {

  static const int MIN_SPEED = 1;
  static const int MAX_SPEED = 4;

  static const double MIN_SIZE = 8.0;
  static const double MAX_SIZE = 16.0;

  final Size space;

  double x, y;
  final int speed;
  final double size;

  final Color color;
  final Paint paint;

  final bool isRandom;

  Fly(this.space, this.x, this.y, this.size, this.speed, this.color, { bool isRandom })
      : isRandom = isRandom ??= false, paint = Paint()..color = color {
    initialize();
  }

  Fly.random(Size space, List<Color> colors,
             {double x, double y, double size, int speed, Color color})
      : this(space,
      x ?? RANDOM.nextDouble() * space.width,
      y ?? RANDOM.nextDouble() * space.height,
      size ?? MIN_SIZE + RANDOM.nextDouble() * (MAX_SIZE - MIN_SIZE),
      speed ?? MIN_SPEED + RANDOM.nextInt(MAX_SPEED - MIN_SPEED),
      color ?? Utils.getRandomColor(colors: colors),
      isRandom: true
  );

  Fly.copy(Fly other) : this(other.space, other.x, other.y, other.size, other.speed, other.color);

  void initialize();

  void render(Canvas canvas);

  void update(double t) {
    var horizontalDirection = RANDOM.nextBool() ? 1 : -1;
    var verticalDirection = RANDOM.nextBool() ? 1 : -1;
    var dx = speed * horizontalDirection;
    var dy = speed * verticalDirection;
    double tx = x + dx;
    double ty = y + dy;
    if (checkLRBounds(tx)) x = tx;
    if (checkTBBounds(ty)) y = ty;
  }

  bool checkLRBounds(double x) => (x - size / 2) > 0 && (x + size / 2) < space.width;
  bool checkTBBounds(double y) => (y - size / 2) > 0 && (y + size / 2) < space.height;

  void onTapDown() {
    // TODO implement
  }

  @override
  String toString() {
    return 'Fly{_space: w${space.width.floor()} s${space.height.floor()},'
        ' _x: ${x.floor()}, _y: ${y.floor()}, '
        '_radius: ${size.floor()}, _color: $color}';
  }

}