import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/game_object.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/movement.dart';

import '../fly_utils.dart';

class Particle extends GameObject {

  static const List<Color> COLORS = [
    Colors.white
  ];

  final Direction direction;
  final int maxLifetime;
  int lifetime = 0;
  int speed;

  Particle(double size, double x, double y, this.direction, this.maxLifetime, this.speed)
      : super(ObjectsShape.CIRCLE, size, x, y){
    paint.color = COLORS[RANDOM.nextInt(COLORS.length)];
  }

  @override
  void update(double t) {
    lifetime++;
    if (lifetime < maxLifetime) {
      Movement movement = Movement(direction, speed);
      x += movement.vector.x;
      y += movement.vector.y;
    } else {
      remove = true;
    }
  }

  @override
  void initialize() {

  }

  @override
  void onTapDown() {

  }

}