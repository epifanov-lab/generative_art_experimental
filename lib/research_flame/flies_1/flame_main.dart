import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flame_engine.dart';

void main() async {
  runApp(FlameEngine().widget);
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
}