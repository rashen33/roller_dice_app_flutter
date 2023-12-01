import 'package:flutter/material.dart';
import 'package:flutter_application_1/new_game.dart';
import 'package:flutter_application_1/roller_dice.dart';

const beginAlignment = Alignment.topLeft; //to enhace the performance
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: 
            LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: colors)
            ),
      child: Center(child: NewGame()),
    );
  }
} 