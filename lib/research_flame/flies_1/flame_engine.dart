import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:generative_arts_1/research_flame/flies_1/flies/game_object.dart';

import 'flies/movement.dart';
import 'flies/objects/fly_impl_2.dart';
import 'flies/objects/particle.dart';

class FlameEngine extends Game {
  static Size screenSize;
  static List<GameObject> objects = List();
  static List<GameObject> buffer = List();

  Paint bgPaint = Paint()..color = Color(0xff576574);

  FlameEngine() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    //_list.addAll(FlyAlpha.spawn(100, screenSize));
  }

  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, screenSize.width, screenSize.height), bgPaint);
    objects.removeWhere((obj) => obj.remove);
    objects.addAll(buffer);
    buffer.clear();
    objects.forEach((fly) {
      fly.render(canvas);

      if (fly is Fly2) {
        buffer.add(Particle(1, fly.x, fly.y,
            Movement.idle().direction,
            10, 0));
      }

    });
  }

  void update(double t) =>
      objects.forEach((objects) => objects.update(t));

  void resize(Size size) => screenSize = size;

  void onTapDown(TapDownDetails d) {
    print('SPAWN: ${d.globalPosition}');
    Offset pos = d.globalPosition;
    objects.add(Fly2.random(size: 6, x: pos.dx, y: pos.dy));
  }

}
