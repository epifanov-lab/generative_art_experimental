import 'package:flutter/material.dart';

import '../utils.dart';

class Exp2 extends StatefulWidget {
  @override
  _Exp2State createState() => _Exp2State();
}

class _Exp2State extends State<Exp2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Container(),
        painter: Exp2Painter(),
      ),
    );
  }
}


class Exp2Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.color = Utils.getRandomColor();
    canvas.drawCircle(Offset(64, 64), 56, paint);

    paint.color = Utils.getRandomColor();
    canvas.drawRect(Rect.fromLTRB(120, 120, 220, 220), paint);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    paint.color = Utils.getRandomColor();
    canvas.drawCircle(Offset(64, 64), 56, paint);

    paint.color = Utils.getRandomColor();
    canvas.drawRect(Rect.fromLTRB(120, 120, 220, 220), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}