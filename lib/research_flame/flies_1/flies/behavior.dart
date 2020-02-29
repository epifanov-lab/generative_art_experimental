import 'package:generative_arts_1/research_flame/flies_1/flies/fly_utils.dart';

import 'fly_base.dart';
import 'movement.dart';

abstract class Behavior {
  Movement lastMove = Movement.idle();
  Movement nextMove;

  void step(Fly fly) {
    fly.x += nextMove.vector.x;
    fly.y += nextMove.vector.y;
    lastMove = nextMove;
    nextMove = null;
  }

}

mixin BehaviorChaotic on Behavior {

  @override
  void step(Fly fly) {
    nextMove = Movement.random(fly.speed);
    super.step(fly);
  }

}

mixin BehaviorDumb on Behavior {

  @override
  void step(Fly fly) {
    nextMove = Movement.closest(lastMove.direction, FlyUtils.getRandomInt(), fly.speed);
    super.step(fly);
  }

}