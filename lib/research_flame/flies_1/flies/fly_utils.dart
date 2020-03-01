import 'dart:math';
import 'dart:ui';

final Random RANDOM = Random();

class FlyUtils {

  static bool checkLRBounds(Size space, double size, double x) =>
      (x - size / 2) > 0 && (x + size / 2) < space.width;

  static bool checkTBBounds(Size space, double size, double y) =>
      (y - size / 2) > 0 && (y + size / 2) < space.height;

  static int getRandomInt() {
    int dir = RANDOM.nextBool() ? 1 : -1;
    int val = RANDOM.nextDouble().round();
    return dir * val;
  }

}
