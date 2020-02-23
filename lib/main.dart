import 'package:flutter/material.dart';

import 'screens/exp_1.dart';
import 'screens/exp_2.dart';
import 'screens/exp_3.dart';
import 'screens/exp_4.dart';

void main() => runApp(GenerativeLabApp());

class GenerativeLabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generative art research',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: SafeArea(
        child: Scaffold(
            body: Exp4()),
      ),
    );
  }
}
