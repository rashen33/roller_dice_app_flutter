import 'package:flutter/material.dart';
import 'package:flutter_application_1/roller_dice.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  bool isNewGameStarted = false;

  @override
  Widget build(BuildContext context) {
    return isNewGameStarted
        ? //using conditional statements
        Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RollerDice(),
              const SizedBox(
                height: 20,
              ),
              InkWell( //Similar to a button
                onTap: () {
                  setState(() {
                    isNewGameStarted = false;
                  });
                },
                child: const Text('< Back to Home' ,
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.deepPurple)
                    ),
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min, //center the content
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Welcome to Roller Dice App',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 42),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isNewGameStarted = true;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 233, 30, 30),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Play New Game'),
                ),
              )
            ],
          );
  }
}
