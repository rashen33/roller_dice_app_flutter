import 'package:flutter/material.dart';
import 'package:flutter_application_1/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iCET Roller Dice App 1'),
          backgroundColor: Colors.brown,
        ),
        body: const GradientContainer(colors:[
          Color.fromARGB(255, 255, 219, 102), 
          Color.fromARGB(255, 131, 91, 18)]),
      ),
    );
  }
}
