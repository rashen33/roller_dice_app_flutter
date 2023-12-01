import 'dart:math';

import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

const numberOfRounds = 5;

class _RollerDiceState extends State<RollerDice> {
  int diceNumber = 1;
  int roundNumber = 1;
  int playerOneRound = 1;
  int playerTwoRound = 1;
  int playerOneWins = 0;
  int playerTwoWins = 0;
  List<int> playerOneScores = [];
  List<int> playerTwoScores = [];
  String whowins = '';

  void playerOneRoll() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOneScores.add(diceNumber);
      playerOneRound++;
    });
  }

  void playerTwoRoll() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwoScores.add(diceNumber);
      playerTwoRound++;
    });
  }

  void otherStates() {
    setState(() {
      if (playerOneRound == playerTwoRound && roundNumber < numberOfRounds) {
        if (playerOneScores[roundNumber] > playerTwoScores[roundNumber]) {
          playerOneWins++;
        } else if (playerOneScores[roundNumber] <
            playerTwoScores[roundNumber]) {
          playerTwoWins++;
        }
        roundNumber++;
      }

      if(roundNumber == numberOfRounds){
        if (playerOneWins > playerTwoWins) {
          whowins = 'Player One Wins!';
        } else if (playerTwoWins > playerOneWins) {
          whowins = 'Player Two Wins!';
        } else {
          whowins = 'It\'s a Draw';
        }
      }

    });
  }

  bool isPlayerOneButtonDisable() {
    if (playerOneRound > playerTwoRound) {
      return true;
    }
    return false;
  }

  bool isPlayerTwoButtonDisable() {
    if (playerTwoRound > playerOneRound) {
      return true;
    }
    return false;
  }

  void reset() {
    setState(() {
        playerTwoWins = 0;
        diceNumber = 1;
        roundNumber = 1;
        playerOneRound = 1;
        playerTwoRound = 1;
        playerOneWins = 0;
        playerOneScores = [];
        playerTwoScores = [];
        whowins = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return roundNumber == numberOfRounds ? Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Game Over', style: TextStyle(fontSize: 38, color: Colors.red)),
        Text('$whowins', style: const TextStyle(fontSize: 38, color: Colors.green)),
        SizedBox(height: 10,),
        InkWell(
          onTap: reset,
          child: const Text('New Game', style : TextStyle(fontSize: 30)),
        )
      ],
    ) : Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Round $roundNumber',
            style: TextStyle(fontSize: 38, color: Colors.deepPurple)),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: isPlayerOneButtonDisable() ? null : playerOneRoll,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                child: const Text('Player 1')),
            const SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: isPlayerTwoButtonDisable()
                    ? null
                    : () {
                        playerTwoRoll();
                        otherStates();
                      },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                child: const Text('Player 2'))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Player 1 : $playerOneWins - $playerTwoWins : Player 2',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const Text(
                  'Round #',
                  style: TextStyle(fontSize: 20),
                ),
                for (var r = 1; r <= playerOneScores.length; r++)
                  Text(
                    'Round $r',
                    style: const TextStyle(fontSize: 20),
                  ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const Text(
                  'Player 1',
                  style: TextStyle(fontSize: 20),
                ),
                for (var score in playerOneScores)
                  Text(
                    '$score',
                    style: const TextStyle(fontSize: 20),
                  ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const Text('Player 2', style: TextStyle(fontSize: 20)),
                for (var score in playerTwoScores)
                  Text(
                    '$score',
                    style: const TextStyle(fontSize: 20),
                  ),
              ],
            )
          ],
        )
      ],
    );
  }
}
