import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils.dart';

class Exp4 extends StatefulWidget {
  @override
  _Exp4State createState() => _Exp4State();
}

class _Exp4State extends State<Exp4> {

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 50),
            (timer) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Container(),
        painter: Exp4Painter(),
      ),
    );
  }

}


class Exp4Painter extends CustomPainter{

  List<Color> _colors = [
    Colors.white,
    Colors.blue[50],
    Colors.blue[100],
    Colors.blue[200],
    Colors.blue[300],
    Colors.blue[400],
    Colors.blue[500],
    Colors.blue[600],
    Colors.blue[700],
    Colors.blue[800],
    Colors.blue[900],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    for(int i = 0; i < 500; i++) {
      double radius = i * 2.0;
      paint.color = _colors[Random().nextInt(_colors.length)];
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //return oldDelegate != this;
    return true;
  }

}