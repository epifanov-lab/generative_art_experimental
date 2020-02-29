import 'dart:ui';

import 'package:generative_arts_1/research_flame/flies_1/flies/base_fly.dart';

class FlyUtils {

  static void draw(Canvas canvas, FlyShape shape,
            double x, double y, double size, Paint paint) {
    switch (shape) {
      case FlyShape.CROSS:
        Path path = Path()
          ..moveTo(x - size / 2, y)
          ..lineTo(x + size / 2, y)
          ..moveTo(x, y - size / 2)
          ..lineTo(x, y + size / 2)
          ..close();
        canvas.drawPath(path, paint);
        break;

      case FlyShape.RECTANGLE:
        Offset position = Offset(x, y);
        Rect rect = Rect.fromCircle(center: position, radius: size);
        canvas.drawRect(rect, paint);
        break;

      case FlyShape.CIRCLE:
        Offset position = Offset(x, y);
        canvas.drawCircle(position, size, paint);
        break;

      case FlyShape.TRIANGLE:
        var path = Path();
        path.moveTo(x, y - size / 3);
        path.lineTo(x + size / 2, y + size / 2);
        path.lineTo(x - size / 2, y + size / 2);
        path.close();
        canvas.drawPath(path, paint);
        break;
    }
  }

}
