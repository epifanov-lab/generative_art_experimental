import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'flies/fly_base.dart';
import 'flies/impl/fly_impl_2.dart';

class FlameEngine extends Game {
  static Size screenSize;
  List<Fly> _list = List();

  FlameEngine() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    //_list.addAll(FlyAlpha.spawn(100, screenSize));
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    _list.forEach((fly) => fly.render(canvas));
  }

  void update(double t) => _list.forEach((fly) => fly.update(t));

  void resize(Size size) => screenSize = size;

  void onTapDown(TapDownDetails d) {
    print('SPAWN: ${d.globalPosition}');
    Offset pos = d.globalPosition;
    _list.add(Fly2.random(x: pos.dx, y: pos.dy));
  }



}
