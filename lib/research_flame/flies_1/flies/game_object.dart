
import 'dart:ui';

import 'package:flutter/material.dart';

enum ObjectsShape { CROSS, RECTANGLE, CIRCLE, TRIANGLE }

abstract class GameObject {
  ObjectsShape shape;
  double size;
  double x, y;
  final Paint paint;

  bool remove = false;

  GameObject(this.shape,  this.size, this.x, this.y) : paint = Paint()..color = Colors.white;

  void render(Canvas canvas) {
    switch (shape) {
      case ObjectsShape.CROSS:
        Path path = Path()
          ..moveTo(x - size / 2, y)
          ..lineTo(x + size / 2, y)
          ..moveTo(x, y - size / 2)
          ..lineTo(x, y + size / 2)
          ..close();
        canvas.drawPath(path, paint);
        break;

      case ObjectsShape.RECTANGLE:
        Offset position = Offset(x, y);
        Rect rect = Rect.fromCircle(center: position, radius: size);
        canvas.drawRect(rect, paint);
        break;

      case ObjectsShape.CIRCLE:
        Offset position = Offset(x, y);
        canvas.drawCircle(position, size, paint);
        break;

      case ObjectsShape.TRIANGLE:
        var path = Path();
        path.moveTo(x, y - size / 3);
        path.lineTo(x + size / 2, y + size / 2);
        path.lineTo(x - size / 2, y + size / 2);
        path.close();
        canvas.drawPath(path, paint);
        break;
    }
  }

  void update(double t);

  void initialize();
  void onTapDown();


}