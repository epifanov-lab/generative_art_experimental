import 'package:flame/position.dart';

import 'fly_utils.dart';

enum Direction
{ NW, N, NE,
  W   ,   E,
  SW, S, SE }

class Movement {

  static List<Position> directions = [
    Position(-1, -1), Position(0, -1), Position(1, -1),
    Position(-1, 0)         ,          Position(1, 0),
    Position(-1, 1), Position(0, 1), Position(1, 1)];

  static Map<Direction, List<Direction>> closestDirs = {
    Direction.NW: [Direction.W, Direction.NW, Direction.N],
    Direction.N: [Direction.NW, Direction.N, Direction.NE],
    Direction.NE: [Direction.E, Direction.NE, Direction.N],
    Direction.W: [Direction.NW, Direction.W, Direction.SW],
    Direction.E: [Direction.NE, Direction.E, Direction.SE],
    Direction.SW: [Direction.W, Direction.SW, Direction.N],
    Direction.S: [Direction.SW, Direction.S, Direction.SE],
    Direction.SE: [Direction.S, Direction.SE, Direction.E]
  };

  static Map<Direction, Direction> oppositeDirs = {
    Direction.NW: Direction.SE,
    Direction.N: Direction.S,
    Direction.NE: Direction.SW,
    Direction.W: Direction.E,
    Direction.E: Direction.W,
    Direction.SW: Direction.NE,
    Direction.S: Direction.N,
    Direction.SE: Direction.NW
  };

  final Direction direction;
  final int speed;
  final Position vector;

  Movement(this.direction, this.speed)
      : vector = calculate(direction, speed);

  Movement.random(int speed)
      : this(getRandomDirection(), speed);

  Movement.closest(Direction to, int where, int speed)
      : this(getClosestDir(to, where), speed);

  Movement.opposite(Direction to, int speed)
      : this(getOppositeDir(to), speed);

  Movement.idle() : this(Direction.N, 0);


  static Position calculate(Direction direction, int speed) {
    Position dir = directions[direction.index];
    return Position(dir.x * speed, dir.y * speed);
  }

  static getRandomDirection() {
    return Direction.values[RANDOM.nextInt(Direction.values.length)];
  }

  static Direction getClosestDir(Direction direction, int where) {
    return closestDirs[direction][1 + where];
  }

  static Direction getOppositeDir(Direction to) => oppositeDirs[to];

  @override
  String toString() {
    return direction.toString();
  }

}