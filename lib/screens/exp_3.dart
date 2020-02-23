import 'dart:math';

import 'package:flutter/material.dart';

import '../utils.dart';

class Exp3 extends StatefulWidget {
  @override
  _Exp3State createState() => _Exp3State();
}

class _Exp3State extends State<Exp3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Container(),
        painter: Exp3Painter(),
      ),
    );
  }
}


class Exp3Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    for(int i = 0; i < 50; i++) {

      double x = Random().nextDouble() * size.width.toInt();
      double y = Random().nextDouble() * size.height.toInt();

      paint.color = Utils.getRandomColor();
      paint.style = PaintingStyle.values[Random().nextInt(PaintingStyle.values.length)];
      if (paint.style == PaintingStyle.stroke) paint.strokeWidth = Random().nextDouble() * 36;

      int shapeSizeMin = 16;
      int shapeSizeMax = 128;
      int shapeInt = Random().nextInt(Shapes.values.length);
      Shapes shape = Shapes.values[shapeInt];

      switch(shape) {

        case Shapes.CIRCLE:
          double radius = shapeSizeMin + Random().nextDouble() * (shapeSizeMax - shapeSizeMin);
          canvas.drawCircle(Offset(x, y), radius, paint);
          break;

        case Shapes.RECTANGLE:
          double width = shapeSizeMin + Random().nextDouble() * (shapeSizeMax - shapeSizeMin);
          double height = shapeSizeMin + Random().nextDouble() * (shapeSizeMax - shapeSizeMin);
          canvas.drawRect(Rect.fromLTWH(x, y, width, height), paint);
          break;

        case Shapes.TRIANGLE:
          double shapeSize = shapeSizeMin + Random().nextDouble() * (shapeSizeMax - shapeSizeMin);
          var path = Path();
          path.moveTo(x, y);
          path.lineTo(x + shapeSize / 2, y + shapeSize);
          path.lineTo(x - shapeSize / 2, y + shapeSize);
          path.close();
          canvas.drawPath(path, paint);
          break;
      }
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

enum Shapes {
  CIRCLE, RECTANGLE, TRIANGLE
}